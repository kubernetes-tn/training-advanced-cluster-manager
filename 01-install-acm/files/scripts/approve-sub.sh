#!/bin/bash
ns=open-cluster-management
iplan=$(oc -n $ns get installplan | grep "advanced-cluster-management" | awk '{print $1}')

oc -n $ns patch installplan ${iplan} \
  --type merge --patch '{"spec":{"approved":true}}'

## TODO wait for CSV to SUCCESSED phase
# oc waitch csv --for=...