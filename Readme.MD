
Before apply infrastructure create `terraform.tfvars` 

### terraform.tfvars
```
subscription_id=xxx
client_id=xxx
client_secret="xxx
tenant_id=xxx
```


Because service would expose only private ip's your service would contain following anotataion

```
annotations:
    service.beta.kubernetes.io/azure-load-balancer-internal: "true"
```    

### hello-node.yaml
```
apiVersion: v1
kind: Service
metadata:
  labels:
    app: hello-node
  name: hello-node
  namespace: default
  annotations:
    service.beta.kubernetes.io/azure-load-balancer-internal: "true"
spec:
  #externalTrafficPolicy: Cluster
  ports:
  - nodePort: 32586
    port: 80
    protocol: TCP
    targetPort: 8080
  selector:
    app: hello-node
  sessionAffinity: None
  type: LoadBalancer
```


test gw like test like curl -kv https://10.121.36.101
create test machine in correct subnet 


https://github.com/terraform-providers/terraform-provider-azurerm/issues/2894
