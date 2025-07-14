## sonar cloud 
1. incluir os projetos em https://sonarcloud.io/projects
2. criar novo token em My Account > Security > Generate Tokens (ex: "GitHubActions") e clique em Generate
3. configurar variaveis no projeto no github, em  "Settings" > "Secrets" > "Actions" e clique em "New repository secret": 
```
SONAR_TOKEN=token_gerado_no_passo_2
SONAR_HOST_URL=https://sonarcloud.io
```

### URLs 
#### Sonar
https://sonarcloud.io/project/overview?id=backstagefood_video-processor-front
https://sonarcloud.io/project/overview?id=backstagefood_video-processor-worker
https://sonarcloud.io/project/overview?id=backstagefood_video-processor-uploader