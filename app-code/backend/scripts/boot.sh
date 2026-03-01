#!/bin/bash

# Wait until the database is ready
until nc -z db 5432; do   
  echo "Waiting for database..."
  sleep 2
done

# Run migrations
./migrate.sh