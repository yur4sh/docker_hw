FROM alpine:latest

RUN apk add --no-cache bash nmap-ncat

EXPOSE 80