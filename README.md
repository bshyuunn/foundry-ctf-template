# foundry-ctf-template

## Getting Started
```
$ forge init --template bshyuunn/foundry-ctf-template my-solidity-challenge
$ cd my-solidity-challenge
$ make
$ nc localhost 31337
```

## 자신의 문제 만들기
문제 환경을 구성하기 위해서는 docker-compose.yml 파일과 
```yml
services:
  simple-challenge:
    build: ./build
    ports:
      - "31337:31337"
      - "8545:8545"
    restart: unless-stopped
    environment:
      - FLAG=CTF{FLAG}
      - PORT=31337
      - HTTP_PORT=8545
      - PUBLIC_IP=localhost
      - SHARED_SECRET=47066539167276956766098200939677720952863069100758808950316570929135279551683
      - ENV=production
      - SETUP_CONTRACT_VALUE=0
      - USER_VALUE=10000000000000
      - EVM_VERSION=cancun # `cancun`, `shanghai`, `paris`, `london`, etc...
```