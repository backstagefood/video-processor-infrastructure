#!/bin/bash

echo "Starting initialization script..."

# Wait for LocalStack to be ready (up to 30 seconds)
max_retries=30
retry_count=0

until aws --endpoint-url=http://localhost:4566 s3 ls &> /dev/null; do
  retry_count=$((retry_count + 1))
  if [ $retry_count -ge $max_retries ]; then
    echo "LocalStack not ready after $max_retries retries. Aborting."
    exit 1
  fi
  echo "Waiting for LocalStack to be ready... ($retry_count/$max_retries)"
  sleep 1
done

echo "LocalStack is ready. Creating resources..."

# Create S3 buckets
buckets=("video-bucket")
for bucket in "${buckets[@]}"; do
  if aws --endpoint-url=http://localhost:4566 s3 ls "s3://$bucket" &> /dev/null; then
    echo "Bucket $bucket already exists"
  else
    aws --endpoint-url=http://localhost:4566 s3 mb "s3://$bucket" && \
    echo "Created bucket: $bucket" || \
    echo "Failed to create bucket: $bucket"
  fi
done

# API Gateway - end
echo "Initialization complete"