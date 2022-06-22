
FROM build-agent

WORKDIR /app

CMD apt update; apt upgrade -y; \
    bash /test/waiter.sh; \
     cd ./wire-desktop; \
     yarn; \ 
     yarn fix:other; \ 
     yarn test:types && yarn lint && yarn prestart && yarn build:ts:tests && yarn test:react && yarn test:bin && yarn clear:coverage;
