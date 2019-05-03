#!/bin/bash

fail()
{
    echo $* 1>&2
    exit 1
}

WORKSHOP_IMAGE="quay.io/openshiftlabs/lab-postgres-operator:master"

TEMPLATE_REPO=https://raw.githubusercontent.com/openshift-labs/workshop-spawner
TEMPLATE_VERSION=3.0.3
TEMPLATE_FILE=learning-portal-production.json
TEMPLATE_PATH=$TEMPLATE_REPO/$TEMPLATE_VERSION/templates/$TEMPLATE_FILE

JUPYTERHUB_APPLICATION=${JUPYTERHUB_APPLICATION:-postgres-lab}

JUPYTERHUB_NAMESPACE=`oc project --short 2>/dev/null`

if [ "$?" != "0" ]; then
    fail "Error: Cannot determine name of project."
    exit 1
fi

echo
echo "### Creating spawner application."
echo

oc process -f $TEMPLATE_PATH \
    --param APPLICATION_NAME="$JUPYTERHUB_APPLICATION" \
    --param PROJECT_NAME="$JUPYTERHUB_NAMESPACE" | oc apply -f -

if [ "$?" != "0" ]; then
    fail "Error: Failed to create deployment for spawner."
    exit 1
fi

echo
echo "### Waiting for the spawner to deploy."
echo

oc rollout status dc/"$JUPYTERHUB_APPLICATION"

if [ "$?" != "0" ]; then
    fail "Error: Deployment of spawner failed to complete."
    exit 1
fi

echo
echo "### Install global operator definitions."
echo

oc apply -f .workshop/resources/ --recursive

if [ "$?" != "0" ]; then
    fail "Error: Failed to create global operator definitions."
    exit 1
fi

echo
echo "### Update spawner configuration for workshop."
echo

oc process -f .workshop/templates/clusterroles-session-rules.yaml \
    --param JUPYTERHUB_APPLICATION="$JUPYTERHUB_APPLICATION" \
    --param JUPYTERHUB_NAMESPACE="$JUPYTERHUB_NAMESPACE" | oc apply -f - && \
oc process -f .workshop/templates/clusterroles-spawner-rules.yaml \
    --param JUPYTERHUB_APPLICATION="$JUPYTERHUB_APPLICATION" \
    --param JUPYTERHUB_NAMESPACE="$JUPYTERHUB_NAMESPACE" | oc apply -f - && \
oc process -f .workshop/templates/configmap-extra-resources.yaml \
    --param JUPYTERHUB_APPLICATION="$JUPYTERHUB_APPLICATION" \
    --param JUPYTERHUB_NAMESPACE="$JUPYTERHUB_NAMESPACE" | oc apply -f -

if [ "$?" != "0" ]; then
    fail "Error: Failed to udpate spawner configuration for workshop."
    exit 1
fi

echo
echo "### Restart the spawner with new configuration."
echo

oc rollout latest dc/"$JUPYTERHUB_APPLICATION"

if [ "$?" != "0" ]; then
    fail "Error: Failed to restart the spawner."
    exit 1
fi

oc rollout status dc/"$JUPYTERHUB_APPLICATION"

if [ "$?" != "0" ]; then
    fail "Error: Deployment of spawner failed to complete."
    exit 1
fi

echo
echo "### Updating spawner to use image for workshop."
echo

oc tag "$WORKSHOP_IMAGE" "${JUPYTERHUB_APPLICATION}-app:latest"

if [ "$?" != "0" ]; then
    fail "Error: Failed to update spawner to use workshop image."
    exit 1
fi

echo
echo "### Route details for the spawner are as follows."
echo

oc get route "${JUPYTERHUB_APPLICATION}"
