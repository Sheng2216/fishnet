#FROM balenalib/aarch64-debian:bullseye-run as runner
FROM alpine:3.14

# Image metadata
LABEL maintainer="RAKwireless"
LABEL authors="https://github.com/chirpstack/chirpstack-mqtt-forwarder"
LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.name="Chirpstack mqtt forwarder docker"
LABEL org.label-schema.description="A Semtech UDP or ChirpStack Concentratord to MQTT forwarder(arm64)"
LABEL org.label-schema.vcs-type="Git"
LABEL org.label-schema.vcs-url="https://github.com/chirpstack/chirpstack-mqtt-forwarder"

WORKDIR /app

### Copy launch script that start chirpstack-concentratord service
COPY chirpstack-mqtt-forwarder /app
### Defines the default executable
CMD [ "./chirpstack-mqtt-forwarder", "-c", "./chirpstack-mqtt-forwarder.toml" ]
