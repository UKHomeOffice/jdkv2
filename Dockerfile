FROM openjdk:alpine

RUN apk --no-cache -U upgrade

ADD ./run.sh /bin/run.sh

RUN addgroup -S java \
    && \
    adduser -D -G java -u 1000 -s /bin/bash -h /home/java java \
    && \
    mkdir /app \
    && \
    chown -R java:java /home/java /app \
    && \
    chmod +x /bin/run.sh

WORKDIR /app

USER 1000

ENTRYPOINT /bin/run.sh
