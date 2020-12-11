# Odoo testing environment for business analyst

Start database

```bash

# Restart

docker-compose build && docker-compose up -d && docker-compose logs -f

# Drop all
docker-compose down -v

# Start new db

$> ./update -i base

# Update all modules

$> ./update -u all

# Enter shell

$> ./shell
```