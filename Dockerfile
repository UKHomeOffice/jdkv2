FROM amazoncorretto:11

RUN yum -y update && \
    yum -y install openssl shadow-utils && \
    groupadd -g 1000 java && \
    adduser -g 1000 -u 1000 -s /bin/bash -d /home/java java && \
    mkdir /app  && \
    chown -R java:java /home/java /app && \
    yum -y clean all

ADD run.sh /usr/bin/run.sh
RUN chmod +x /usr/bin/run.sh

ENTRYPOINT /usr/bin/run.sh

