---
Title: Run the Operator Locally
PrevPage: step08
NextPage: finish
---

In order to speed up Operator deployment and testing, `operator-sdk` provides a mechanism to run the Operator outside of a cluster.


## Copying Roles for local development
It is important that the Role path referenced in watches.yaml exists on
your machine. 

We previously ran our Ansible Operator from a container where the Role was
copied to a known location specified by the Dockerfile.

To run our Operator locally, we will manually copy any Roles used by our Operator to a configured Ansible
Roles path for our local machine (e.g /etc/ansible/roles).

```execute-1
cp -r roles/dymurray.memcached_operator_role /opt/ansible/roles/
```

## Running with 'operator-sdk up local'


### Start the Operator
```execute-1
operator-sdk up local --namespace tutorial
```

Next start using the second terminal window.

```execute-2
cd memcached-operator
```

### Create the Custom Resource

Create the example Memcached CR that was generated at deploy/crds/cache_v1alpha1_memcached_cr.yaml:

```execute-2
oc create -f deploy/crds/cache_v1alpha1_memcached_cr.yaml
```

Ensure that the memcached-operator creates the deployment for the CR:

<small>
```sh
$ oc get deployment
NAME               DESIRED CURRENT UP-TO-DATE AVAILABLE AGE
example-memcached  4       4       4          4         34s
```
</small>

Check the pods to confirm 4 replicas were created:

<small>
```sh
$ oc get pods
NAME                               READY STATUS   RESTARTS AGE
example-memcached-6cc844747c-dp8sx 1/1   Running  0        1m
example-memcached-6cc844747c-hk52c 1/1   Running  0        1m
example-memcached-6cc844747c-q75m4 1/1   Running  0        1m
example-memcached-6cc844747c-xp8qp 1/1   Running  0        1m
```
</small>

### Cleanup

Clean up the resources:

```execute-2
oc delete -f deploy/crds/cache_v1alpha1_memcached_cr.yaml
```

```execute-2
oc delete -f deploy/role_binding.yaml
```

```execute-2
oc delete -f deploy/role.yaml
```

```execute-2
oc delete -f deploy/service_account.yaml
```

```execute-2
oc delete -f deploy/crds/cache_v1alpha1_memcached_crd.yaml
```
