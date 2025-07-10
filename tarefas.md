# tarefas do hackaton

## desenvolver uma aplicação utilizando os conceitos apresentados no curso:

- [x] Desenho de arquitetura
- [x] Desenvolvimento de microsserviços
- [x] Qualidade de Software
- [x] Mensageria
- [x] E outros conceitos abordados

## Funcionalidades Essenciais

- [x] A nova versão do sistema deve processar mais de um vídeo ao mesmo tempo
- [x] Em caso de picos, o sistema não deve perder uma requisição
- [x] O Sistema deve ser protegido por usuário e senha
- [x] O fluxo deve ter uma listagem de status dos vídeos de um usuário
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
- [x] Banco de Dados: PostgreSQL + Redis (cache) (ou um outro de preferência do grupo)
- [ ] Monitoramento: Prometheus + Grafana, ELK Stack ou algo de preferência do grupo
- [ ] CI/CD: GitHub Actions (ou algo de preferência do grupo)

### pendencias
- ajustar tabela no frontend para incluir o status 
- ajustar worker para ter maximo de tarefas
- enviar sequencia com multiplas requisicoes para processamento
- rodar tudo no kubernetes



```
func (f *fileConsumer) ConsumeClaim(session sarama.ConsumerGroupSession, claim sarama.ConsumerGroupClaim) error {
	for message := range claim.Messages() {
		slog.Info("recebendo nova mensagem",
			slog.String("topic", message.Topic),
			slog.String("key", string(message.Key)),
			slog.String("value", string(message.Value)),
		)

		var filePayload domain.FilePayload
		if err := json.Unmarshal(message.Value, &filePayload); err != nil {
			slog.Error("não foi possível receber a mensagem do topico kafka", slog.String("error", err.Error()))
			session.MarkMessage(message, "")
			continue
		}

		slog.Info("video recebido com sucesso", "filePayload", filePayload)
		session.MarkMessage(message, "")
		// gravar arquivo
		fileId := f.insertFile(&filePayload)

		if fileId != nil {
			go func() {
				f.atualizaStatus(fileId, &domain.FileProcessingResult{FilePath: nil, FileSize: nil, Status: 2, Message: "em processamento"})
				processingResult := f.processFile(context.Background(), filePayload.FilePath, filePayload.UserName)
				f.atualizaStatus(fileId, processingResult)
			}()
		}

	}
	return nil
}
```
