#!/bin/bash
set -e

# Function to wait for database
wait_for_db() {
    echo "Waiting for PostgreSQL to be ready..."
    while ! python -c "import psycopg2; psycopg2.connect(host='postgres-svc', user='$POSTGRES_USERNAME', password='$POSTGRES_PASSWORD', database='$POSTGRES_DB')" 2>/dev/null; do
        echo "PostgreSQL is unavailable - sleeping"
        sleep 2
    done
    echo "PostgreSQL is up - continuing with migrations"
}

# Wait for database to be ready
wait_for_db

# Apply migrations
python manage.py migrate --noinput

# Collect static files
python manage.py collectstatic --noinput

# Start gunicorn
gunicorn core.wsgi:application --bind 0.0.0.0:8000 --workers 4 --timeout 60