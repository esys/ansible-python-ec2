
test_container: 
	@echo "Testing container"
	@cd python && docker-compose up -d --build
	@sleep 5
	curl localhost:5000 -so /dev/null -w "%{http_code}"
	@cd python && docker-compose down

deploy:
	@echo "Deploying application"
	ansible-playbook -i hosts --ask-vault-pass flask.yml

clean:
	@echo "Cleaning EC2 instance"
	ansible-playbook -i hosts --ask-vault-pass clean.yml