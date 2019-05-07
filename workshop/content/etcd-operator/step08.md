---
Title: Delete the Cluster
PrevPage: step07
NextPage: finish
---

Now that we have seen how Etcd operator works, let's delete everything related to this operator form the cluster.

First, we will delete the Etcd cluster:

```execute-1
oc delete etcdcluster example-etcd-cluster
```
Now that there is no cluster running, we can delete the operator itself:

```execute-1
oc delete deployment etcd-operator
```
And the last bit to delete is the Custom Resource Definition for Etcd:

```execute-1
oc delete crd etcdclusters.etcd.database.coreos.com
```

With this our Etcd cluster and operator are fully removed from our OpenShift cluster.
