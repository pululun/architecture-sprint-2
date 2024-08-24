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
docker volume remove mongo-sharding_config-data-sharding mongo-sharding_shard1-data-sharding mongo-sharding_shard2-data-sharding
```
