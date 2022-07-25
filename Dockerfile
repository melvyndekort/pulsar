FROM debian:11-slim

RUN apt-get update && apt-get install -y openjdk-17-jre-headless curl && apt-get clean

WORKDIR /opt
RUN curl -sL https://archive.apache.org/dist/pulsar/pulsar-2.10.1/apache-pulsar-2.10.1-bin.tar.gz | tar -xz
ENV PATH $PATH:/opt/apache-pulsar-2.10.1/bin

WORKDIR /root

EXPOSE 6650
EXPOSE 8080

ENTRYPOINT ["/opt/apache-pulsar-2.10.1/bin/pulsar"]

CMD ["standalone"]

