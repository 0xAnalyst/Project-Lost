docker.build:
	docker build -t Project-Lost .

serve:
	docker run --rm -it -v ${PWD}:/src --workdir /src -p 127.0.0.1:4000:4000 lotp
