FROM alpine:latest

ENV PATH=/google-cloud-sdk/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# Install Java 8, CURL, Python3, bash for Pub/Sub emulator
RUN apk --update add openjdk8-jre curl python3 bash

# Download, unzip, & install gcloud SDK
RUN curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-377.0.0-linux-arm.tar.gz \
    & tar -xf google-cloud-sdk-377.0.0-linux-arm.tar.gz \
    & ./google-cloud-sdk/install.sh

# Install gcloud pubsub-emulator
RUN gcloud components install pubsub-emulator beta --quiet

# Volume to persist Pub/Sub data
VOLUME /opt/data

COPY start-pubsub .

EXPOSE 8432

ENTRYPOINT ["./start-pubsub"]