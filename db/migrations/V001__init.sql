-- Users table
CREATE TABLE users (
   id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
   name varchar(100) NOT NULL UNIQUE,
   email varchar(100) NOT NULL UNIQUE,
   created_at timestamptz NOT NULL DEFAULT now(),
   updated_at timestamptz NULL
);

-- Video status enumeration table
CREATE TABLE file_status (
  id SMALLINT PRIMARY KEY,
  status varchar(20) NOT NULL UNIQUE -- PENDING, PROCESSING, PROCESSED, ERROR
);


-- Videos table
-- Videos table (now references status ID)
CREATE TABLE files (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id uuid NOT NULL REFERENCES users(id),
    video_file_path varchar(255) NOT NULL,
    zip_file_path varchar(255),
    video_file_size bigint, -- Size in bytes
    zip_file_size bigint, -- Size in bytes
    status_id SMALLINT NOT NULL REFERENCES file_status(id),
    processing_result varchar(255) DEFAULT NULL,
    created_at timestamptz NOT NULL DEFAULT now(),
    updated_at timestamptz,
    CONSTRAINT unique_user_file UNIQUE (user_id, video_file_path)
);

-- Indices
CREATE INDEX idx_videos_user_id ON files (user_id);
CREATE INDEX idx_videos_status_id ON files (status_id);

-- clear tables
TRUNCATE files, users, file_status RESTART IDENTITY CASCADE;

-- Pre-populate status values
INSERT INTO file_status (id, status) VALUES
  (1, 'pendente'),
  (2, 'em processamento'),
  (3, 'processado'),
  (4, 'erro');

-- Insert specific users
INSERT INTO users (name, email, created_at, updated_at) VALUES
     ('Hamilton', 'hfantin@gmail.com', '2025-06-10 08:00:00', null),
     ('User', 'user@gmail.com', '2025-06-11 09:00:00', null);
