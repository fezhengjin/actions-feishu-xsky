FROM golang:1.14.4-alpine3.12 as builder


WORKDIR /app
COPY . .

ENV GOPROXY="https://goproxy.io,direct"
ENV GOPRIVATE="*.xsky.com"

RUN CGO_ENABLED=0 go build -o bin/feishu .

FROM scratch

COPY --from=builder /app/bin/feishu /app

ENTRYPOINT [ "/app" ]
