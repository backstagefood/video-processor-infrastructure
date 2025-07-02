# tarefas do hackaton

## desenvolver uma aplicação utilizando os conceitos apresentados no curso:

- [x] Desenho de arquitetura
- [x] Desenvolvimento de microsserviços
- [ ] Qualidade de Software
- [x] Mensageria
- [ ] E outros conceitos abordados

## Funcionalidades Essenciais

- [ ] A nova versão do sistema deve processar mais de um vídeo ao mesmo tempo
- [ ] Em caso de picos, o sistema não deve perder uma requisição
- [x] O Sistema deve ser protegido por usuário e senha
- [ ] O fluxo deve ter uma listagem de status dos vídeos de um usuário
- [ ] Em caso de erro, um usuário pode ser notificado (e-mail ou outro meio de
comunicação)

## Arquitetura e Infraestrutura

- [x] O sistema deve persistir os dados
- [x] O sistema deve estar em uma arquitetura que o permita ser escalado
- [x] O projeto deve ser versionado no Github
- [ ] O projeto deve ter testes que garantam a sua qualidade CI/CD da aplicação
- [ ] CI/CD da aplicação

## Pilha tecnologica recomendada

- [x] Containers: Docker + Kubernetes ou Docker Compose
- [x] Mensageria: RabbitMQ, Apache Kafka ou similar
- [ ] Banco de Dados: PostgreSQL + Redis (cache) (ou um outro de preferência do grupo)
- [ ] Monitoramento: Prometheus + Grafana, ELK Stack ou algo de preferência do grupo
- [ ] CI/CD: GitHub Actions (ou algo de preferência do grupo)

### pendencias
- ajustar tabela no frontend para incluir o status 
- ajustar worker para ter maximo de tarefas
- enviar sequencia com multiplas requisicoes para processamento
- rodar tudo no kubernetes

