FROM golang:1.22-alpine3.20 AS builder

RUN go install go.uber.org/mock/mockgen@v0.4.0
RUN go install github.com/daixiang0/gci@v0.13.4

FROM alpine:3.20

WORKDIR /bin
COPY --from=builder /go/bin/mockgen /bin/mockgen
COPY --from=builder /go/bin/gci /bin/gci