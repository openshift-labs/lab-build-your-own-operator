#!/bin/bash

set -x

oc delete clusterrole pgocrdreader pgopclusterrole pgopclusterrolecrd

oc delete crd pgbackups.cr.client-go.k8s.io \
          pgclusters.cr.client-go.k8s.io \
          pgpolicies.cr.client-go.k8s.io \
          pgreplicas.cr.client-go.k8s.io \
          pgtasks.cr.client-go.k8s.io \
          pgupgrades.cr.client-go.k8s.io
