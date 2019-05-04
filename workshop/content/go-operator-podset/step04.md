---
Title: Add a Controller
PrevPage: step03
NextPage: step05
---

Add a new Controller to the project that will watch and reconcile the PodSet resource:

```execute-1
operator-sdk add controller --api-version=app.example.com/v1alpha1 --kind=PodSet
```
<br>

This will scaffold a new Controller implementation under `go/src/github.com/redhat/podset-operator/pkg/controller/podset/podset_controller.go`.
