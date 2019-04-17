# Golang-kafka-oracle

Golang with kafka lib ([librdkafka](https://github.com/edenhill/librdkafka)) and oracle driver ([go-oci8](https://github.com/mattn/go-oci8)).

## Use

### Kafka lib

````
package main

import (
  "log"
  "github.com/confluentinc/confluent-kafka-go/kafka"
)

func main() {
  kServer := "[your-kafka-server-ip]"
  kProducer, err := kafka.NewProducer(&kafka.ConfigMap{"bootstrap.servers": kServer})

  if err != nil {
    log.Fatalf("Unable to create producer, kafka server: %s, error: %v.\n", kServer, err)
  }
  
  log.Printf("Create producer ok.\n", dbConnect)
}
````

### Oracle driver

````
package main

import (
  "log"
  "database/sql"
  _ "github.com/mattn/go-oci8"
)

func main() {
  dbConnect := "account/password@127.0.0.1:1521/servicename"
  db, err := sql.Open("oci8", dbConnect)

  if err != nil {
    log.Fatalf("Unable to connect DB \"%s\", error: %v.\n", dbConnect, err)
  }

  log.Printf("Connect DB \"%s\" ok.\n", dbConnect)
}
````

### Sql Plus

Use: `docker exec -it [container-id] bash`

````
root@container-id:/# /usr/lib/instantclient_18_5/sqlplus account/password@127.0.0.1:1521/servicename
````