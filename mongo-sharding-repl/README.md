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
docker volume remove mongo-sharding-repl_config-data-sharding-replica mongo-sharding-repl_replica1-data-sharding-replica mongo-sharding-repl_replica2-data-sharding-replica mongo-sharding-repl_replica3-data-sharding-replica mongo-sharding-repl_replica4-data-sharding-replica mongo-sharding-repl_replica5-data-sharding-replica mongo-sharding-repl_replica6-data-sharding-replica
```
