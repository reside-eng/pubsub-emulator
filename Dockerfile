FROM alpine:latest

ENV PATH $PATH:/root/google-cloud-sdk/bin

# Install Java 8, CURL, Python2, bash for Pub/Sub emulator
RUN apk --update add openjdk8-jre curl python2 bash \
    && rm /var/cache/apk/*

RUN curl https://sdk.cloud.google.com > install.sh \
    && bash install.sh --disable-prompts \
    && gcloud components install pubsub-emulator beta --quiet

# Volume to persist Pub/Sub data
VOLUME /opt/data

COPY start-pubsub .

EXPOSE 8432

ENTRYPOINT ["./start-pubsub"]