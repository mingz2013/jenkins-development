.PHONY: help
help:
	@echo '                                                                          '
	@echo 'Makefile for afk6-test                                                    '
	@echo '                                                                          '
	@echo 'Usage:                                                                    '
	@echo '   make help                           show help                          '
	@echo '                                                                          '
	@echo '   make run                            运行容器                           '
	@echo '                                                                          '
	@echo '                                                                          '
	@echo '                                                                          '
	@echo '   make up                             启动服务                            '
	@echo '   make down                           停止服务                            '
	@echo '   make logs                           查看日志                            '
	@echo '                                                                          '


.PHONY: run
run:
	docker run \
  -u root \
  --rm \
  -d \
  -p 8080:8080 \
  -p 50000:50000 \
  -v jenkins-data:/var/jenkins_home \
  -v /var/run/docker.sock:/var/run/docker.sock \
  jenkinsci/blueocean



.PHONY: up
up:
	docker-compose  up -d


.PHONY: down
down:
	docker-compose  down


.PHONY: logs
logs:
	docker-compose  logs -f
