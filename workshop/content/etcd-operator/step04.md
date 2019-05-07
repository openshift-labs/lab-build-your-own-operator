---
Title: Create EtcdCluster
PrevPage: step03
NextPage: step05
---

Create an Etcd cluster by referring to the new Custom Resource, `EtcdCluster`, defined in the Custom Resource Definition on Step 1:

```execute-1
cat > etcd-operator-cr.yaml<<EOF
apiVersion: etcd.database.coreos.com/v1beta2
kind: EtcdCluster
metadata:
  name: example-etcd-cluster
spec:
  size: 3
  version: 3.1.10
EOF
```
<br>
```execute-1
oc create -f etcd-operator-cr.yaml
```
<br>
Verify the cluster object was created:

```execute-1
oc get etcdclusters
```
<br>
Watch the pods in the Etcd cluster get created:

```execute-1
oc get pods -l etcd_cluster=example-etcd-cluster -w
```

Once the pods are running, just exit the watch:

```execute-1
<ctrl+c>
```

<br>
Verify the cluster has been exposed via a ClusterIP service:

```execute-1
oc get services -l etcd_cluster=example-etcd-cluster
```
