---
Title: Customize the Spec and Status
PrevPage: step02
NextPage: step04
---

Modify the spec and status of the `PodSet` Custom Resource(CR) by copying the provided file into place at `go/src/github.com/redhat/podset-operator/pkg/apis/app/v1alpha1/podset_types.go`:

```execute-1
cp ~/podset_types.go ~/go/src/github.com/redhat/podset-operator/pkg/apis/app/v1alpha1/podset_types.go
```

After modifying the `*_types.go` file, always run the following command to update the generated code for that resource type:

```execute-1
operator-sdk generate k8s
```
<br>
We can also automatically update the CRD with [OpenAPI v3 schema](https://kubernetes.io/docs/tasks/access-kubernetes-api/custom-resources/custom-resource-definitions/#validation) details based off the newly updated `*_types.go` file:

```execute-1
operator-sdk generate openapi
```
<br>
Observe the CRD now reflects the `spec.replicas` and `status.podNames` OpenAPI v3 schema validation in the spec:

```execute-1
cat deploy/crds/app_v1alpha1_podset_crd.yaml
```
<br>
Deploy your PodSet Custom Resource Definition to the live OpenShift Cluster:

```execute-1
oc create -f deploy/crds/app_v1alpha1_podset_crd.yaml
```
<br>
Confirm the CRD was successfully created:

```execute-1
oc get crd
```
