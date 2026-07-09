FROM golang:1.26-alpine AS builder

WORKDIR /go/src/app

COPY go.mod go.sum ./

RUN go mod download

COPY *.go ./

RUN CGO_ENABLED=0 GOOS=linux go build -ldflags="-s -w" -o app .

FROM gcr.io/distroless/static:latest AS build-release

WORKDIR /usr/local/bin/

COPY --from=builder /go/src/app/app ./app

EXPOSE 8080

USER nonroot:nonroot

ENTRYPOINT [ "./app" ]