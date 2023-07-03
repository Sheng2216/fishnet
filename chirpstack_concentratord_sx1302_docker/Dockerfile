FROM balenalib/aarch64-debian:bullseye-run as runner

# Image metadata
LABEL maintainer="RAKwireless"
LABEL authors="https://github.com/chirpstack/chirpstack-concentratord"
LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.name="Chirpstack concentratord docker"
LABEL org.label-schema.description="LoRa(WAN) concentrator daemon for sx1302(arm64)"
LABEL org.label-schema.vcs-type="Git"
LABEL org.label-schema.vcs-url="https://github.com/chirpstack/chirpstack-concentratord"
LABEL org.label-schema.license="MIT License (MIT)"

WORKDIR /app

### Copy launch script that start chirpstack-concentratord service
COPY chirpstack-concentratord-sx1302 /app
### Run the start.sh script during reboots 
# CMD [ "start.sh" ]
CMD [ "./chirpstack-concentratord-sx1302", "-c", "./concentratord.toml" ]
