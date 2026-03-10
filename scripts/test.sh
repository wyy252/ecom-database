set -e

docker rm -f ecom-database-test >/dev/null 2>&1 || true
docker build -t ecom-database:test .
docker run -d --name ecom-database-test -e POSTGRES_DB=ecommerce -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres ecom-database:test
sleep 12
docker exec ecom-database-test psql -U postgres -d ecommerce -c "\dt"
docker exec ecom-database-test psql -U postgres -d ecommerce -c "SELECT COUNT(*) FROM products;"
docker exec ecom-database-test psql -U postgres -d ecommerce -c "SELECT COUNT(*) FROM orders;"
docker rm -f ecom-database-test