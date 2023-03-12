# Odoo testing environment for load balancing

Start database

## Introduction

We are using Nginx as load balancer for 2 Odoo instances

## Sharing same code base

That is not a problem since the image is used for both and this way the file hashes are the same.

## Operations

### Initializing the instance

```bash
$> ./init
```

### Updating modules

```bash
$> docker exec -it odoo_cron odoo --stop-after-init --no-http --max-cron-threads 0 -u all
```

### Using the Odoo Shell

```bash
# access the shell
$> docker exec -it odoo_cron odoo shell --no-http --max-cron-threads 0
# piping a script
$> docker exec -i odoo_cron odoo shell --no-http --max-cron-threads 0 < test/test_script.py
```

### Checking Redis

```bash
# enter redis-cli
$> docker exec -it redis redis-cli
# check all keys
127.0.0.1:6379> keys *
1) "session:e0b45142aa8d9a8d9ec0ab24ae307ba78bca9620"
127.0.0.1:6379> keys *
127.0.0.1:6379> get session:e0b45142aa8d9a8d9ec0ab24ae307ba78bca9620
"{\"db\": \"odoo14\", \"uid\": 2, \"login\": \"admin\", \"session_token\": \"53f3d6e27dbdcc9466aa9fed058a88f4d931a8c30d549ce55cc77f5664a69c81\", \"context\": {\"lang\": \"en_US\", \"tz\": \"Europe/Lisbon\", \"uid\": 2}, \"debug\": \"\", \"geoip\": {}}"
```
