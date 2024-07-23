FROM golang:1.22

RUN apt-get update && apt-get install -y sqlite3

ENV CGO_ENABLED=0

ENV GOOS=linux

ENV GOARCH=amd64

WORKDIR /app

COPY go.mod go.sum ./

RUN go mod download

COPY *.go ./

RUN go build -o /docker_final_main_app

COPY my_database.db /app/

CMD ["/docker_final_main_app"]
