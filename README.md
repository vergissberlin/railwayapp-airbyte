# Airbyte (Server)

![Airbyte Icon](./railwayapp-airbyte.svg)

Deploy Airbyte server components on Railway.

[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/deploy/ILtPlT?referralCode=2_sIT9&utm_medium=integration&utm_source=template&utm_campaign=generic)

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

This keeps the repository simple while giving you a clean starting point for your own stack.

## Environment variables

```bash
DATABASE_URL=postgresql://airbyte:airbyte@postgres:5432/airbyte
TEMPORAL_HOST=temporal:7233
```

Adjust variables based on your final Airbyte architecture.

## Notes

- Use persistent storage for connector state and logs.
- For production, run Worker and Webapp as separate Railway services.
