---
Title: Delete the Cluster
PrevPage: step07
NextPage: finish
---

Delete your Etcd cluster:

```execute-1
oc delete etcdcluster example-etcd-cluster
```
<br>
Delete the Etcd Operator:

```execute-1
oc delete deployment etcd-operator
```
<br>
Delete the Etcd CRD:

```execute-1
oc delete crd etcdclusters.etcd.database.coreos.com
```
<br>
