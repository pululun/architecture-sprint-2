#!/bin/bash

###
# Инициализация кластера
###

docker compose exec -T configSrv mongosh --port 27020 --quiet <<EOF
rs.initiate(
  {
    _id : "config_server",
       configsvr: true,
    members: [
      { _id : 0, host : "configSrv:27020" }
    ]
  }
);
EOF

docker-compose exec -T replica1 mongosh --port 27018 --quiet <<EOF
rs.initiate(
    {
      _id : "shard1",
      members: [
        { _id : 0, host : "replica1:27018" },
        { _id : 1, host : "replica2:27019" },
        { _id : 2, host : "replica3:27021" }
      ]
    }
);
EOF

docker-compose exec -T replica4 mongosh --port 27022 --quiet <<EOF
rs.initiate(
    {
      _id : "shard2",
      members: [
        { _id : 0, host : "replica4:27022" },
        { _id : 1, host : "replica5:27023" },
        { _id : 2, host : "replica6:27024" }
      ]
    }
  );
EOF

sleep 5

docker-compose exec -T mongos_router mongosh --port 27017 --quiet <<EOF
sh.addShard( "shard1/replica1:27018");
sh.addShard( "shard1/replica2:27019");
sh.addShard( "shard1/replica3:27021");

sh.addShard( "shard2/replica4:27022");
sh.addShard( "shard2/replica5:27023");
sh.addShard( "shard2/replica6:27024");


sh.enableSharding("somedb");
sh.shardCollection("somedb.helloDoc", { "name" : "hashed" } )

use somedb

for(var i = 0; i < 1000; i++) db.helloDoc.insert({age:i, name:"ly"+i})
EOF

