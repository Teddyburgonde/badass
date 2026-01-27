up:
	docker build -t gns3-router router
	docker build -t gns3-host host

down:
	docker stop $$(docker ps -q --filter ancestor=gns3-router) 2>/dev/null || true
	docker stop $$(docker ps -q --filter ancestor=gns3-host) 2>/dev/null || true

fclean: down
	docker rmi -f gns3-router gns3-host 2>/dev/null || true
	docker system prune -f

re: fclean up

.PHONY: up down fclean re