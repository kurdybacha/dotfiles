build:
	docker build -t esp:latest .

run:
	docker run --rm -it -v ${HOME}:${HOME} -v ${PWD}:/project -w /project --device=/dev/ttyUSB0 esp:latest /bin/bash -c "source ~/.bashrc && tmux"
