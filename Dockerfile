FROM golang:1.16

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY main.go .

ENV REDIS_HOST=redis
ENV REDIS_PORT=6379

RUN go build -o counter .

CMD ["./counter"]
