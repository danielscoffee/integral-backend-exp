FROM golang:1.23.2-alpine3.10

WORKDIR /app 

RUN apk add --no-cache make

RUN make

CMD [ "make run" ]
