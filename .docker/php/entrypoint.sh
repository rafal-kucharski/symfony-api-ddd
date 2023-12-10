#!/bin/bash

sleep 10

#php bin/console doctrine:migrations:migrate --no-interaction

exec "$@"

