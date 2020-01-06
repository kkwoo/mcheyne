FROM alpine
RUN apk update
RUN apk add make
RUN apk add w3m
CMD /bin/sh