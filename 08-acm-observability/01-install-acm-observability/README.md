# Validate Installation:
**Hub side** `oc describe mco observability | grep -A 6 Status`

**Managed Clusters Side** `oc -n open-cluster-management-addon-observability get all `
