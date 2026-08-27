# helm deployment

```
# to install diracx-cms helm chart please use the following command:
helm install diracx-cms ./helm/diracx-cms -f ./helm/values-localhost.yaml --namespace diracx-cms --create-namespace --wait

# to uninstall helm chart you may use
helm uninstall diracx-cms -n diracx-cms

# to list existing helm chart
helm list -n diracx-cms
```

For more information please read helm/diracx-cms/README.md file

