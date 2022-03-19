## Multi arch docker image to run a pubsub emulator

[Docker Hub](https://hub.docker.com/repository/docker/sideinc/pubsub-emulator)

## Building a new image

1. Create a new builder

   ```
   $ docker buildx create --name mybuilder
   ```

1. Switch to the new builder and bootstrap

   ```
   $ docker buildx use mybuilder
   $ docker buildx inspect --bootstrap
   ```

1. Build and push the image to Docker Hub
   ```
   $ docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v6 -t sideinc/pubsub-emulator:1.0.0 -t sideinc/pubsub-emulator:latest --push .
   ```
