.PHONY: build run kill enter push pull

build:
	sudo docker build --rm -t symbiosis-jessie .

run: kill
	sudo docker run -d --name symbiosis -v $$(pwd):/project -p 8044:80 symbiosis-jessie

kill:
	-sudo docker kill symbiosis
	-sudo docker rm symbiosis

enter:
	sudo docker exec -it symbiosis sh -c "export TERM=xterm && bash"

log:
	sudo docker logs -f symbiosis

# git commands for quick chaining of make commands
push:
	git push --all
	git push --tags

pull:
	git pull
