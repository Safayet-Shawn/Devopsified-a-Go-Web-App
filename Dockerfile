
FROM golang:1.22.5 as builder
WORKDIR /app
COPY go.mod  ./
RUN go mod download 
COPY . .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o main

FROM alpine:latest
RUN apk --no-cache add ca-certificates
COPY --from=builder /app/main .
COPY --from=builder /app/static ./static
EXPOSE 8080
ENTRYPOINT [ "/main" ]