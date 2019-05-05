---
Title: Add a Pod
PrevPage: step04
NextPage: step06
---

Let's now create another pod and attempt to connect to the etcd cluster via `etcdctl`:

```execute-1
oc run etcdclient --image=busybox busybox --restart=Never -- /usr/bin/tail -f /dev/null
```
<br>
Access the pod:

``` 
oc rsh etcdclient
```
<br>

Install the Etcd Client:

```execute-1
wget https://github.com/coreos/etcd/releases/download/v3.1.4/etcd-v3.1.4-linux-amd64.tar.gz
tar -xvf etcd-v3.1.4-linux-amd64.tar.gz
cp etcd-v3.1.4-linux-amd64/etcdctl .
```
<br>
Set the etcd version and endpoint variables:

```execute-1
export ETCDCTL_API=3
export ETCDCTL_ENDPOINTS=example-etcd-cluster-client:2379
```
<br>
Attempt to write a key/value into the Etcd cluster:

```execute-1
./etcdctl put operator sdk
./etcdctl get operator
```
<br>
Exit out of the client pod:

```execute-1
exit
```
