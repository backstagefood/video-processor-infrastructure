## comando uteis 
### localstack bucket 

- create a bucket
> aws --endpoint-url=http://localhost:4566 s3 mb s3://video-bucket
- List all buckets
> aws --endpoint-url=http://localhost:4566 s3 ls

- List contents of a specific bucket
> aws --endpoint-url=http://localhost:4566 s3 ls s3://video-bucket
> aws --endpoint-url=http://localhost:4566 s3 ls s3://video-bucket --recursive
> aws --endpoint-url=http://localhost:4566 s3 ls s3://video-bucket --recursive | awk -F/ '{for (i=2;i<NF;i++) printf "  "} {print $NF}'

- check file 
> aws --endpoint-url=http://localhost:4566 s3api head-object --bucket your-bucket-name --key path/to/file
> aws --endpoint-url=http://localhost:4566 s3api head-object --bucket video-bucket --key seumadruga_gmail_com/videos/20250619_144904_sample_1.mp4

- Get bucket details
> aws --endpoint-url=http://localhost:4566 s3api get-bucket-location --bucket video-bucket

- Check if bucket exists
> aws --endpoint-url=http://localhost:4566 s3api head-bucket --bucket video-bucket


- Basic file upload
aws --endpoint-url=http://localhost:4566 s3 cp ./my-video.mp4 s3://video-bucket/

- Upload with public read permissions
aws --endpoint-url=http://localhost:4566 s3 cp ./my-video.mp4 s3://video-bucket/ --acl public-read

- Upload entire directory recursively
aws --endpoint-url=http://localhost:4566 s3 cp ./videos/ s3://video-bucket/ --recursive

- Sync directory (only upload changes)
aws --endpoint-url=http://localhost:4566 s3 sync ./videos/ s3://video-bucket/


## enviar arquivo via curl: 


curl -X POST -H "Authorization: Basic $(echo -n 'chaves@gmail.com:123456' | base64)" -F "video=@/dados/videos/series/Rick.and.Morty.S05/Rick.and.Morty.S05E02.Mortyplicity.1080p.AMZN.WEB-DL.DDP5.1.H.264-NTb.mkv" http://localhost:3000/api/upload
curl -X POST -H "Authorization: Basic $(echo -n 'chaves@gmail.com:123456' | base64)" -F "video=@/home/hamilton/Videos/sample_2.mp4" http://localhost:3000/api/upload



