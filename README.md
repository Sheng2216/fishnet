# Dual lora modules on RAK7391

This repository contains a skeleton for setting up the [ChirpStack](https://www.chirpstack.io)
open-source LoRaWAN Network Server (v4), and Chirpstack concentratord, as well as chirpstack-mqtt-forwarder, using [Docker Compose](https://docs.docker.com/compose/) on RAKwireless WisGate Connect (RAK7391) with dual lora modules.

## Directory layout

- `docker-compose.yml`: the docker-compose file containing the services
- `configuration/chirpstack`: directory containing the ChirpStack configuration files
- `configuration/chirpstack-gateway-bridge`: directory containing the ChirpStack Gateway Bridge configuration
- `configuration/mosquitto`: directory containing the Mosquitto (MQTT broker) configuration
- `configuration/postgresql/initdb/`: directory containing PostgreSQL initialization scripts
- `configuration/chirpstack-mqtt-forwarder`: directory containing configurations for chirpstack-mqtt-forwarder that points to the local/cloud NS
- `configuration/concentratord`: directory containing configurations for RAK5146(USB version) mounted to slot 1/slot 2

## Configuration

TODO

## Usage

To start the ChirpStack simply run:

```bash
$ docker-compose up
```

After all the components have been initialized and started, you should be able
to open http://localhost:8080/ in your browser.

##

The example includes the [ChirpStack REST API](https://github.com/chirpstack/chirpstack-rest-api).
You should be able to access the UI by opening http://localhost:8090 in your browser.

**Note:** It is recommended to use the [gRPC](https://www.chirpstack.io/docs/chirpstack/api/grpc.html)
interface over the [REST](https://www.chirpstack.io/docs/chirpstack/api/rest.html) interface.
