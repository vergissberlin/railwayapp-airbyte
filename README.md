# Airbyte (Server)

Deploy Airbyte server components on Railway.

## Files in this template

- `Dockerfile` uses the official `airbyte/server` image.
- `railway.toml` adds health checks and restart policy.

## Important

Airbyte production setup is multi-service. This repository is a **server template base**.
For a complete setup, add companion services in Railway:

- PostgreSQL
- Temporal
- Airbyte Worker
- Airbyte Webapp

## Environment variables

```bash
DATABASE_URL=postgresql://airbyte:airbyte@postgres:5432/airbyte
```

Adjust variables based on your final Airbyte architecture.
