start-localstack:
	docker-compose down
	docker-compose up -d

build:
	npm run build 	

deploy:
	awslocal s3 mb s3://artifacts
	samlocal deploy --stack-name lambda --s3-bucket artifacts  --capabilities CAPABILITY_IAM 

log:
	docker logs -f lokal-stack-playground_localstack_1

start: build start-localstack deploy log

list-lambdas:
	awslocal lambda list-functions