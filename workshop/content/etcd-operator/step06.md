---
Title: Scale the Etcd Cluster
PrevPage: step05
NextPage: step07
---

Let's change the size of the Etcd `example-etcd-cluster` CR. The Etcd Operator pod will detect the CR `spec.size` change and modify the number of pods in the cluster:

```execute-1
oc patch etcdcluster example-etcd-cluster --type='json' -p '[{"op": "replace", "path": "/spec/size", "value":5}]'
```
<br>

Let's change the version of our `example-etcd-cluster` CR. The etcd-operator pod will detect the CR `spec.version` change and create a new cluster with the newly specified image:

```execute-1
oc patch etcdcluster example-etcd-cluster --type='json' -p '[{"op": "replace", "path": "/spec/version", "value":3.2.13}]'
```
