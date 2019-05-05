---
Title: Create a PodSet
PrevPage: step06
NextPage: finish
---

In a new terminal, inspect the Custom Resource manifest:

```execute-1
cd tutorial/go/src/github.com/redhat/podset-operator/
cat deploy/crds/app_v1alpha1_podset_cr.yaml
```
<br>
Ensure your `kind: PodSet` Custom Resource (CR) is updated with `spec.replicas`:

```execute-1
cat >deploy/crds/app_v1alpha1_podset_cr.yaml <<EOL
apiVersion: app.example.com/v1alpha1
kind: PodSet
metadata:
  name: example-podset
spec:
  replicas: 3
EOL
```

Deploy your PodSet Custom Resource to the live OpenShift Cluster:

```execute-1
oc create -f deploy/crds/app_v1alpha1_podset_cr.yaml
```
<br>
Verify the PodSet operator has created 3 pods:

```execute-1
oc get pods
```
<br>
Verify that status shows the name of the pods currently owned by the PodSet:

```execute-1
oc get podset example-podset -o yaml
```
<br>
Increase the number of replicas owned by the PodSet:

```execute-1
oc patch podset example-podset --type='json' -p '[{"op": "replace", "path": "/spec/replicas", "value":5}]'
```
