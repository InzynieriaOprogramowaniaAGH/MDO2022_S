FROM golang:1.12-alpine
RUN apk add --no-cache git make gcc libc-dev
RUN go get -v github.com/jteeuwen/go-bindata/go-bindata
WORKDIR /go/cowyo
COPY . .
RUN make build
EXPOSE 8050
CMD ["/go/cowyo/cowyo","--data","/data","--allow-file-uploads","--max-upload-mb","10","--host","0.0.0.0"]
