#!/bin/sh

docker build -t daviestobialex/shovel:mifos -f custom/Dockerfile .
docker tag daviestobialex/shovel:mifos daviestobialex/shovel:mifos
docker push daviestobialex/shovel:mifos
