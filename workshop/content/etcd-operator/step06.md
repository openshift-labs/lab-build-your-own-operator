---
Title: Scale the Etcd Cluster
PrevPage: step05
NextPage: step07
---

Let's change the size of the Etcd `example-etcd-cluster` CR. The Etcd Operator pod will detect the CR `spec.size` change and modify the number of pods in the cluster. To be able to verify that things are working, let's watch for our pods on the upper terminal:

```execute-1
watch oc get pods
```

Now that we know the pods that are there, let's patch our ETCD Custom Resource:

```execute-2
oc patch etcdcluster example-etcd-cluster --type='json' -p '[{"op": "replace", "path": "/spec/size", "value":5}]'
```

We should now see how more pods are being created to honour the scale of the cluster we set.

Let's change the version of our `example-etcd-cluster` CR. The etcd-operator pod will detect the CR `spec.version` change and create a new cluster with the newly specified image:

```execute-2
oc patch etcdcluster example-etcd-cluster --type='json' -p '[{"op": "replace", "path": "/spec/version", "value":3.2.13}]'
```

This will take a while, but we will see pods being stopped and created as the version of the cluster is being upgraded.

Once you're done, let's stop watching for the running pods.

```execute-1
<ctrl+c>
```
