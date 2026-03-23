# Deploy and Host Airbyte on Railway

![Template Header](./template-header.svg)


[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/deploy/ILtPlT?referralCode=2_sIT9&utm_medium=integration&utm_source=template&utm_campaign=generic)

Airbyte is an open-source data integration platform. It syncs data from APIs, databases, files, and SaaS apps into warehouses, lakes, and other destinations using configurable connectors and schedules—so teams can centralize analytics-ready data without hand-building a new pipeline for every source.

## About Hosting Airbyte

Hosting Airbyte is a multi-service job: you run a control plane (API server and usually a web UI), workers that execute syncs, PostgreSQL for metadata and state, and Temporal for reliable workflow orchestration. On Railway you typically model each part as its own service, connect them over private networking, set secrets and environment variables, and add volumes where you need persistence for logs or connector state. This repository is a **server-only** template—a minimal base image plus Railway deploy settings—so you still add PostgreSQL, Temporal, Airbyte Worker, and Airbyte Webapp (or equivalents) to match [Airbyte’s architecture](https://docs.airbyte.com/). Tune health checks, retries, and worker capacity for production traffic.

## Common Use Cases

- Replicate product, billing, and CRM data into a warehouse for BI and self-serve analytics
- Run incremental syncs from operational databases or SaaS tools into a lake or mart
- Standardize EL/ELT behind one platform instead of maintaining many custom extract scripts

## Dependencies for Airbyte Hosting

- **PostgreSQL** — stores Airbyte configuration, connection metadata, and sync state
- **Temporal** — orchestrates durable sync workflows; pair with **Airbyte Worker** and **Airbyte Webapp** for a full UI-driven stack

### Deployment Dependencies

- [Airbyte documentation](https://docs.airbyte.com/) — architecture, configuration, and operations
- [Airbyte on Docker](https://docs.airbyte.com/deploying-airbyte/) — official deployment patterns and images
- [Railway documentation](https://docs.railway.com/) — services, networking, variables, and volumes
- Docker image reference: [`airbyte/server`](https://hub.docker.com/r/airbyte/server) (this template pins a version in the `Dockerfile`)

### Implementation Details

This template ships a small surface area you can extend on Railway:

- `Dockerfile` — runs the official server image (pin updates the Airbyte version):

```dockerfile
FROM airbyte/server:0.64.5
```

- `railway.toml` — Dockerfile builder plus health check and restart policy:

```toml
[build]
builder = "DOCKERFILE"

[deploy]
healthcheckPath = "/api/v1/health"
healthcheckTimeout = 300
restartPolicyType = "ON_FAILURE"
restartPolicyMaxRetries = 10
```

Set core variables in Railway (see `.env.example` in the repo). Typical values once sibling services exist:

```bash
DATABASE_URL=postgresql://airbyte:airbyte@postgres:5432/airbyte
TEMPORAL_HOST=temporal:7233
```

Adjust hostnames and credentials to match your Railway service names. Use persistent storage where Airbyte or connectors expect durable state; run Worker and Webapp as separate services for production.

## Why Deploy Airbyte on Railway?

<!-- Recommended: Keep this section as shown below -->
Railway is a singular platform to deploy your infrastructure stack. Railway will host your infrastructure so you don't have to deal with configuration, while allowing you to vertically and horizontally scale it.

By deploying Airbyte on Railway, you are one step closer to supporting a complete full-stack application with minimal burden. Host your servers, databases, AI agents, and more on Railway.
<!-- End recommended section -->

<!-- footer -->
[![Airbyte](https://img.shields.io/badge/Airbyte-615EFF?style=for-the-badge&logo=airbyte&logoColor=white)](https://github.com/vergissberlin/railwayapp-airbyte)
