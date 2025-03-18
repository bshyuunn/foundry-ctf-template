all: install-foundry build-contracts start-challenge-server

install-foundry:
	git submodule update --remote lib/forge-std

start-challenge-server: install-foundry build-contracts
	docker compose up --build -d

stop-challenge-server:
	docker-compose down

build-contracts: install-foundry
	 forge build

clean:
	rm -rf build/out/ && rm -rf cache/ && rm -rf lib/