# Gerar o arquivo (execute no terminal)
echo "user@gmail.com:$(openssl passwd -apr1 123456)" > .htpasswd

# testes 
curl -X POST -u "user@gmail.com:123456" http://localhost:5000/api/status -H "X-User-Email: user@gmail.com"
curl -X GET -u "user@gmail.com:123456" http://localhost:5000/api/status -H "X-User-Email: user@gmail.com"