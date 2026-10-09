# Pinned to 0.63.19, the last Airbyte release that still ships a docker-compose.yaml.
# Airbyte dropped Docker Compose support after 0.63.x (August 2024); 1.x and 2.x are
# Kubernetes/abctl only and cannot run as a plain container on Railway.
FROM airbyte/server:2.4.0
