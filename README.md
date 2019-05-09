# Kubernetes Operator Lab

Team:

 * Ryan Jarvinen
 * Josh Wood
 * Jan Kleinert
 * Michael Hrivnak (replacing Marek Jelen)

The latest lab content is available for review at:

>  [learn.openshift.com/operatorframework](https://learn.openshift.com/operatorframework/)

### Outline
Allotted time: 2 hours

slides: https://docs.google.com/presentation/d/1oSEH9TqXMM62O9VTNZdD37fPJL4YyuloqaKCayO7wOQ/edit?usp=sharing

See the output of the [lab setup](#Lab_Setup) section (below) for a link to your live copy of the lab materials (sections 2,3,4)

 1. [What is an Operator, and why do you care?](https://docs.google.com/presentation/d/1oSEH9TqXMM62O9VTNZdD37fPJL4YyuloqaKCayO7wOQ/edit?usp=sharing)

 2. See an Operator in action with Etcd

 3. Build an Operator with the Operator SDK (using Go)

 4. Build an Operator with the Operator SDK (using Ansible)

 5. The Operator Community (meet us in the booth for more interactive examples!)

### Lab Setup

Deploy the lab materials and interactive web terminals (`cluster-admin` access level required)

   1. oc login https://api.cluster-$GUID.$GUID.openshiftworkshop.com:6443
   2. oc new-project workshops
   3. ./.workshop/scripts/deploy-spawner.sh
   4. ./.workshop/scripts/build-workshop.sh
   5. oc get route

After loading the resulting lab url, use `oc login` to authenticate as a cluster admin to follow along 
