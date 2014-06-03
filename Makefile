.PHONY: build run

build:
	sudo docker build --rm=true -t symbiosis-wheezy-demo .

run:
	sudo docker run -i -t -v $$(pwd):/project -p 8044:80 symbiosis-wheezy-demo
