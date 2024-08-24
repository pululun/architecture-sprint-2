# pymongo-api

## Как запустить

Запускаем mongodb и приложение

```shell
docker compose up -d
```

Формирование кластера и заполнение mongodb данными

```shell
./scripts/mongo-init.sh
```

Остановка и удаление volume
```shell
docker-compose down
docker volume remove sharding-repl-cache_config-data-sharding-replica-cache sharding-repl-cache_redis_data-cache sharding-repl-cache_replica1-data-sharding-replica-cache sharding-repl-cache_replica2-data-sharding-replica-cache sharding-repl-cache_replica3-data-sharding-replica-cache sharding-repl-cache_replica4-data-sharding-replica-cache sharding-repl-cache_replica5-data-sharding-replica-cache sharding-repl-cache_replica6-data-sharding-replica-cache
```
