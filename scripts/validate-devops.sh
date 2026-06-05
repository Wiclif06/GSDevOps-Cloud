#!/usr/bin/env bash
set -e

echo "=== Subindo containers ==="
docker compose up -d --build

echo "=== Containers ==="
docker ps

echo "=== Logs APP ==="
docker logs --tail=80 agroorbit-app-rm563901

echo "=== Logs DB ==="
docker logs --tail=80 agroorbit-db-rm563901

echo "=== Exec APP ==="
docker exec agroorbit-app-rm563901 pwd
docker exec agroorbit-app-rm563901 ls -l
docker exec agroorbit-app-rm563901 whoami

echo "=== Tabelas no Banco ==="
docker exec agroorbit-db-rm563901 psql -U postgres -d agroorbit -c "\dt"

echo "=== SELECTs de evidencia ==="
docker exec agroorbit-db-rm563901 psql -U postgres -d agroorbit -c "SELECT COUNT(*) AS total_users FROM tb_user;" || true
docker exec agroorbit-db-rm563901 psql -U postgres -d agroorbit -c "SELECT COUNT(*) AS total_farms FROM tb_farm;" || true
docker exec agroorbit-db-rm563901 psql -U postgres -d agroorbit -c "SELECT COUNT(*) AS total_crop_areas FROM tb_crop_area;" || true

echo "=== Swagger ==="
echo "Abra: http://localhost:8080/swagger-ui.html"
