FROM openjdk:alpine

RUN apk --no-cache -U upgrade \
    && \
    apk add --no-cache -U java-cacerts \
    && \
    ln -sf /etc/ssl/certs/java/cacerts $JAVA_HOME/jre/lib/security/cacerts

ADD ./run.sh /bin/run.sh

RUN addgroup -S java \
    && \
    adduser -D -G java -u 1000 -s /bin/bash -h /home/java java \
    && \
    mkdir /app \
    && \
    chown -R java:java /home/java /etc/ssl/certs /app \
    && \
    chmod +x /bin/run.sh

WORKDIR /app

USER java

ENTRYPOINT /bin/run.sh