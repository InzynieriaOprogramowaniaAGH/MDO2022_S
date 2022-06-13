FROM golang:1.13-alpine AS build

WORKDIR /src/
COPY hello.go go.* /src/

RUN CGO_ENABLED=0 go build -o /bin/hello

FROM scratch
COPY --from=build /bin/hello /bin/hello
ENTRYPOINT ["/bin/hello"]