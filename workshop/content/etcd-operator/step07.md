---
Title: Delete a Pod
PrevPage: step06
NextPage: step08
---

Let's now delete a pod from the cluster and watch recovery in real-time.

First we're going to monitor our current pods on the upper terminal:

```execute-1
watch oc get pods
```

Now, we're going to delete the first pod we find by running this command on the lower terminal:

```execute-2
export EXAMPLE_ETCD_CLUSTER_POD=$(oc get pods -l app=etcd -o jsonpath='{.items[0].metadata.name}')
oc delete pod $EXAMPLE_ETCD_CLUSTER_POD
```

You should see in the upper terminal how the pod is deleted and a new pod is being started soon after. 

Once we have verified that the ETCD operator has act to recover from a failure, let's stop watching for the pods we have and continue the labs.

```execute-1
<ctrl+c>
```
