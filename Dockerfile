FROM golang:1.21.6
WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY *.go ./
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /app/main .
COPY tracker.db .
CMD ["/app/main"]