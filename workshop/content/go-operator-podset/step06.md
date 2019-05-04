---
Title: Start the Operator
PrevPage: step05
NextPage: step07
---

Now we can test our logic by running our Operator outside the cluster via our `kubeconfig` credentials. Once running, you will see its output in terminal 2.

```execute-2
operator-sdk up local --namespace myproject
```
