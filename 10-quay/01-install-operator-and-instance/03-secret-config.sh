oc -n registry create secret generic \
   --from-file config.yaml=../snippets/config.yaml \
   ##   --from-file ldap.crt=./ldap.crt \ ## IF required
   init-config-bundle-secret