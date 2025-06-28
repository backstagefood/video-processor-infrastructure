# Gerar o arquivo (execute no terminal)
echo "madruga@gmail.com:$(openssl passwd -apr1 123456)" > .htpasswd
echo "chaves@gmail.com:$(openssl passwd -apr1 123456)" >> .htpasswd


# testes 
curl -X POST -u "madrug@gmail.com:123456" http://localhost:5000/api/status -H "X-User-Email: madruga@gmail.com"
curl -X GET -u "madugra@gmail.com:123456" http://localhost:5000/api/status -H "X-User-Email: madugra@gmail.com"