FROM golang:1.15.7-alpine

WORKDIR /app

ENV CGO_ENABLED=0 \
    GOOS=linux \
    GOARCH=amd64

COPY ./ ./

RUN go build -o helloworld

FROM scratch

COPY --from=0 /app/helloworld ./

ENTRYPOINT ["./helloworld"]
