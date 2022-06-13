FROM node:13

WORKDIR ./deth
CMD sh -c "yarn && yarn build && cd .. && cp -r deth public && tar -czf deth.tar.gz /deth && cp deth.tar.gz /public"