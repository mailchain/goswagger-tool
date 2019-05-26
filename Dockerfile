FROM golang:alpine

LABEL maintainer="robdefeo@gmail.com"

RUN apk add curl jq git gcc libc-dev

RUN curl -o /usr/local/bin/swagger -L'#' $(curl -s https://api.github.com/repos/go-swagger/go-swagger/releases/latest | \
  jq -r '.assets[] | select(.name | contains("'"$(uname | tr '[:upper:]' '[:lower:]')"'_amd64")) | .browser_download_url')
RUN chmod +x /usr/local/bin/swagger

RUN go get -u github.com/ethereum/go-ethereum

CMD ["swagger", "version"]
