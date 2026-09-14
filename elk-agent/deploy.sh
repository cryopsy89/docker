#!/bin/bash

echo "AGENT_HOSTNAME=$(hostname -s)" > .env
test -n "${FLEET_ENROLLMENT_TOKEN}" || {
	echo "FLEET_ENROLLMENT_TOKEN must be set" >&2
	exit 1
}
printf 'FLEET_ENROLLMENT_TOKEN=%s\n' "$FLEET_ENROLLMENT_TOKEN" >> .env
docker compose up -d

