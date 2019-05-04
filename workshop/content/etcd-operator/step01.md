---
Title: Create a New Project
PrevPage: intro
NextPage: step02
---

Let's begin by creating a new project called `myproject`:

```execute-1
oc new-project myproject
```
<br>
Create the Custom Resource Definition (CRD) for the Etcd Operator:

```execute-1
cat > etcd-operator-crd.yaml<<EOF
apiVersion: apiextensions.k8s.io/v1beta1
kind: CustomResourceDefinition
metadata:
  name: etcdclusters.etcd.database.coreos.com
spec:
  group: etcd.database.coreos.com
  names:
    kind: EtcdCluster
    listKind: EtcdClusterList
    plural: etcdclusters
    shortNames:
    - etcdclus
    - etcd
    singular: etcdcluster
  scope: Namespaced
  version: v1beta2
  versions:
  - name: v1beta2
    served: true
    storage: true
EOF
```
<br>
```execute-1
oc create -f etcd-operator-crd.yaml
```
<br>
Verify the CRD was successfully created.

```execute-1
oc get crd
```
