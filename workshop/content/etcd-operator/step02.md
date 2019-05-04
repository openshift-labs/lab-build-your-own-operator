---
Title: Create RBAC
PrevPage: step01
NextPage: step03
---

Create a dedicated Service Account responsible for running the Etcd Operator:

```execute-1
cat > etcd-operator-sa.yaml<<EOF
apiVersion: v1
kind: ServiceAccount
metadata:
  name: etcd-operator-sa
EOF
```
<br>
```execute-1
oc create -f etcd-operator-sa.yaml
```
<br>
Verify the Service Account was successfully created:

```execute-1
oc get sa
```
<br>
Create the Role that the `etcd-operator-sa` Service Account will need for authorization to perform actions against the Kubernetes API:

```execute-1
cat > etcd-operator-role.yaml<<EOF
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: etcd-operator-role
rules:
- apiGroups:
  - etcd.database.coreos.com
  resources:
  - etcdclusters
  - etcdbackups
  - etcdrestores
  verbs:
  - '*'
- apiGroups:
  - ""
  resources:
  - pods
  - services
  - endpoints
  - persistentvolumeclaims
  - events
  verbs:
  - '*'
- apiGroups:
  - apps
  resources:
  - deployments
  verbs:
  - '*'
- apiGroups:
  - ""
  resources:
  - secrets
  verbs:
  - get
EOF
```
<br>
```execute-1
oc create -f etcd-operator-role.yaml
```
<br>
Verify the Role was successfully created:

```execute-1
oc get roles
```
<br>
Create the RoleBinding to bind the `etcd-operator-role` Role to the `etcd-operator-sa` Service Account:

```execute-1
cat > etcd-operator-rolebinding.yaml<<EOF
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: etcd-operator-rolebinding
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: Role
  name: etcd-operator-role
subjects:
- kind: ServiceAccount
  name: etcd-operator-sa
  namespace: myproject
EOF
```
<br>
```execute-1
oc create -f etcd-operator-rolebinding.yaml
```
<br>
Verify the RoleBinding was successfully created:

```execute-1
oc get rolebindings
```
