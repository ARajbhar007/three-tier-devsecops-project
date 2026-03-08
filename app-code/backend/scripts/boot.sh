#!/bin/bash
set -e

# Function to wait for database
wait_for_db() {
    echo "Waiting for PostgreSQL to be ready..."
    max_attempts=30
    attempt=1
    while ! python -c "import psycopg2; psycopg2.connect(host='${POSTGRES_HOST}', port=${POSTGRES_PORT}, user='${POSTGRES_USERNAME}', password='${POSTGRES_PASSWORD}', database='${POSTGRES_DB}')" 2>/dev/null; do
        if [ $attempt -ge $max_attempts ]; then
            echo "Failed to connect to PostgreSQL after $max_attempts attempts"
            exit 1
        fi
        echo "PostgreSQL is unavailable - sleeping (Attempt $attempt/$max_attempts)"
        sleep 2
        attempt=$((attempt + 1))
    done
    echo "PostgreSQL is up - continuing with migrations"
}

# Wait for database to be ready
wait_for_db

# Apply migrations
python manage.py migrate --noinput

# Collect static files
python manage.py collectstatic --noinput

# Start gunicorn with exec to replace the shell process
exec gunicorn core.wsgi:application --bind 0.0.0.0:8000 --workers 4 --timeout 60 --access-logfile - --error-logfile -