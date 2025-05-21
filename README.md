# OpenFactory-SDK

**OpenFactory Software Development Kit**

The **OpenFactory-SDK** provides tools to develop and test OpenFactory applications in a simplified development environment. Instead of requiring a full OpenFactory and Kafka cluster setup, this SDK uses lightweight Docker containers to simulate the necessary infrastructure.

---

## Deploy OpenFactory-SDK in a Dev Container

The SDK includes a DevContainer **Feature** that automatically sets up the OpenFactory infrastructure inside your development environment.

To use it, add the following to your `devcontainer.json`:

```json
"features": {
  "docker-in-docker": {
    "version": "latest"
  },
  "ghcr.io/demo-smart-factory-concordia-university/openfactory-sdk/infra:latest": {}
}
```
