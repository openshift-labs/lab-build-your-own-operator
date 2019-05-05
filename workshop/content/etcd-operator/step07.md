---
Title: Delete a Pod
PrevPage: step06
NextPage: step08
---

In another session delete a pod from the cluster and watch recovery in real-time.

```execute-2
export EXAMPLE_ETCD_CLUSTER_POD=$(oc get pods -l app=etcd -o jsonpath='{.items[0].metadata.name}')
oc delete pod $EXAMPLE_ETCD_CLUSTER_POD
```
