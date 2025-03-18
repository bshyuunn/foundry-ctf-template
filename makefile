all: install build-contracts start-challenge-server

install:
	git submodule update --init --recursive

start-challenge-server: install build-contracts
	docker compose up --build -d

stop-challenge-server:
	docker-compose down

build-contracts: install
	 forge build

clean:
	rm -rf build/out/ && rm -rf cache/ && rm -rf lib/