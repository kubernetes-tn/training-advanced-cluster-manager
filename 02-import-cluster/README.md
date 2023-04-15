# Overview
Helm chart helps to generate resources in the Hub cluster to be able to import an existing cluster.

# Steps
- 1. Set the cluster name `.Values.managedClusterName`
- 2. Run helm chart in the Hub Cluster
- 3- Extract the 2 files (klusterlet-crd.yaml) & (import.yaml) 
- 4- Swtich to the target cluster, and apply resources in 2 files
- 5- Validate in target-cluster : Keep watching health of resources in target-cluster:
```
oc get pod -n open-cluster-management-agent
watch oc get pod -n open-cluster-management-agent-addon
```
-6- Validate in hub cluster `oc get managedcluster` should be JOINED=true & AVAILABLE=true
