#!/bin/bash

set -x
set -eo pipefail

WORKSHOP_NAME=lab-build-your-own-operator
JUPYTERHUB_APPLICATION=${JUPYTERHUB_APPLICATION:-build-operator-lab}
JUPYTERHUB_NAMESPACE=`oc project --short`

oc delete all --selector build="$WORKSHOP_NAME"
