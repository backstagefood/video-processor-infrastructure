# tarefas do hackaton

## desenvolver uma aplicação utilizando os conceitos apresentados no curso:

- [ ] Desenho de arquitetura
- [ ] Desenvolvimento de microsserviços
- [ ] Qualidade de Software
- [ ] Mensageria
- [ ] E outros conceitos abordados

## Funcionalidades Essenciais

- [ ] A nova versão do sistema deve processar mais de um vídeo ao mesmo tempo
- [ ] Em caso de picos, o sistema não deve perder uma requisição
- [ ] O Sistema deve ser protegido por usuário e senha
- [ ] O fluxo deve ter uma listagem de status dos vídeos de um usuário
- [ ] Em caso de erro, um usuário pode ser notificado (e-mail ou outro meio de
comunicação)

## Arquitetura e Infraestrutura

- [ ] O sistema deve persistir os dados
- [ ] O sistema deve estar em uma arquitetura que o permita ser escalado
- [ ] O projeto deve ser versionado no Github
- [ ] O projeto deve ter testes que garantam a sua qualidade CI/CD da aplicação
- [ ] CI/CD da aplicação

## Pilha tecnologica recomendada

- [ ] Containers: Docker + Kubernetes ou Docker Compose
- [ ] Mensageria: RabbitMQ, Apache Kafka ou similar
- [ ] Banco de Dados: PostgreSQL + Redis (cache) (ou um outro de preferência do grupo)
- [ ] Monitoramento: Prometheus + Grafana, ELK Stack ou algo de preferência do grupo
- [ ] CI/CD: GitHub Actions (ou algo de preferência do grupo)

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
