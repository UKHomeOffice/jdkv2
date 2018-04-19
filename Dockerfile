FROM openjdk:alpine

RUN apk add --no-cache -U java-cacerts \
    && \
    ln -sf /etc/ssl/certs/java/cacerts $JAVA_HOME/jre/lib/security/cacerts


RUN addgroup -S java \
    && \
    adduser -D -G java -u 1000 -s /bin/bash -h /home/java java \
    && \
    chown -R java:java /home/java /etc/ssl/certs

USER 1000