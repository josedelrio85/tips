# KUBERNETES TIPS

## DEPLOY


### **PASSPORT**
[PRE]
```bash
kubectl --namespace data set image deployments/passport-pre passport=952729869933.dkr.ecr.eu-west-1.amazonaws.com/passport:7c684d9670e3334aab42a82d97c199891eb986f0
```




### **EVENTORAMA**
[PRO]
```bash
kubectl -n data set image deployments/eventorama eventorama=952729869933.dkr.ecr.eu-west-1.amazonaws.com/eventorama:bc32a6db2fcfbd5d253958fdcdff07d0868fe587
```




### **KINKON**
[PRE]
```bash
kubectl -n euskaltel-pre set image deployments/euskaltel-kinkon-web-pre euskaltel-kinkon-web=952729869933.dkr.ecr.eu-west-1.amazonaws.com/euskaltel-kinkon-web-pre:934e0574d62e35b1fcb614235c7c19d133456315
```

[PRO]
```bash
kubectl -n euskaltel set image deployments/euskaltel-kinkon-web euskaltel-kinkon-web=952729869933.dkr.ecr.eu-west-1.amazonaws.com/euskaltel-kinkon-web-pro:6ffc814912542e9f8c37440eebe9aeb8f7daea1b
```




### **RUEIRO**
[PRE]
```bash
kubectl -n bysidecar-pre set image deployments/rueiro-pre rueiro=952729869933.dkr.ecr.eu-west-1.amazonaws.com/rueiro:0ce3410217bfb635a36ecdd005cac6b7dc467e16
```

[PRO]
```bash
kubectl -n bysidecar set image deployments/rueiro rueiro=952729869933.dkr.ecr.eu-west-1.amazonaws.com/rueiro:2278567cf505db7aec46d764842124d229ad8990
```




### **LEADS**
[PRE]
```bash
kubectl -n bysidecar-pre set image deployments/leads-pre leads=952729869933.dkr.ecr.eu-west-1.amazonaws.com/leads:0ae1f04a1945ea612c212940cc2dcd801b4531dc
```

[PRO]
```bash
kubectl -n bysidecar set image deployments/leads leads=952729869933.dkr.ecr.eu-west-1.amazonaws.com/leads:0ae1f04a1945ea612c212940cc2dcd801b4531dc
```





### **ABANCA-ENDTOEND-WEB**
[PRE]
```bash
kubectl -n abanca-pre set image deployments/abanca-endtoend-website-pre abanca-end2end-website=952729869933.dkr.ecr.eu-west-1.amazonaws.com/abanca-endtoend-website-pre:0a9b37bb176d1b9342553ac8c145ae6eb81f7114
```

[PRO]
```bash
kubectl -n abanca set image deployments/abanca-endtoend-website abanca-end2end-website=952729869933.dkr.ecr.eu-west-1.amazonaws.com/abanca-endtoend-website-pro:564ac5de05b557c892602b51252e0345569d3025
```





### **FACEHOOK**
[PRO]
```bash
kubectl -n euskaltel set image deployments/facehook facehook=952729869933.dkr.ecr.eu-west-1.amazonaws.com/facehook:e7ad11f0e831494fd00083a5bff7b4dcca1d4fb6
```




### **GOOGLEHOOK**
[PRE]
```bash
kubectl -n bysidecar-pre set image deployments/googlehook-pre googlehook=952729869933.dkr.ecr.eu-west-1.amazonaws.com/googlehook:3f069e0effc6e09eb86363fd8843aaf7e8ce08a5
```

[PRO]
```bash
kubectl -n bysidecar set image deployments/googlehook googlehook=952729869933.dkr.ecr.eu-west-1.amazonaws.com/googlehook:d7c7876bf2bc81502e76b31e310c013c456efad3
```




### **ABANCA-ENDTOEND-API**
[PRE]
```bash
kubectl -n abanca-pre set image deployments/abanca-endtoend-api-pre abanca-endtoend-api=952729869933.dkr.ecr.eu-west-1.amazonaws.com/abanca-endtoend-api:99ce9927d17f1caf1feeee2eb0fd3423638907c6
```





### **R-EMPRESAS**
[PRE]
```bash
kubectl -n euskaltel-pre set image deployments/kinkon-empresas-pre kinkon-empresas=952729869933.dkr.ecr.eu-west-1.amazonaws.com/kinkon-empresas-pre:a4d63fa8c3765a0d7af288e1bf3228c7ede509f1
```

[PRO]
```bash
kubectl -n euskaltel set image deployments/kinkon-empresas kinkon-empresas=952729869933.dkr.ecr.eu-west-1.amazonaws.com/kinkon-empresas-pro:d7eb12d3a671424df24883d32a09cd3967119f1f
```





### **ADESLAS-WEB**
[PRE]
```bash
kubectl -n adeslas-pre set image deployments/adeslas-web-pre adeslas-web=952729869933.dkr.ecr.eu-west-1.amazonaws.com/adeslas-web-pre:56ad3a66545a1fe94c03831d34040be444a23f5b
```

[PRO]
```bash
kubectl -n adeslas set image deployments/adeslas-web adeslas-web=952729869933.dkr.ecr.eu-west-1.amazonaws.com/adeslas-web:58b030c123ba512f679d9e304204efeef495038c
```





### **VIRGIN-BLOG**
[PRE]
```bash
kubectl -n virgin-pre set image deployments/virgin-blog-pre virgin-blog-pre=952729869933.dkr.ecr.eu-west-1.amazonaws.com/virgin_blog:799a817b02420a5897ab9bbf8ee92aef827e1646
```

[PRO]
```bash
kubectl -n virgin set image deployments/virgin-blog virgin-blog=952729869933.dkr.ecr.eu-west-1.amazonaws.com/virgin_blog:374b11eb1887288b3436c1dbe6f7c69c465c3436
```





### **VIRGIN-WEB**
[PRE]
```bash
kubectl -n virgin-pre set image deployments/virgin-web-pre virgin-web-pre=952729869933.dkr.ecr.eu-west-1.amazonaws.com/virgin-web-pre:32e7c484c4dd8fcfa4f6a1a96359c283ab598c7a
```

[PRO]
```bash
kubectl -n virgin set image deployments/virgin-web virgin-web=952729869933.dkr.ecr.eu-west-1.amazonaws.com/virgin-web:0dce212d3db6371aa99a65749058cf57f2cf591d
```




### **LOADDATAREPORT**

```bash
kubectl -n bysidecar-pre set image deployments/loaddatareport loaddatareport=952729869933.dkr.ecr.eu-west-1.amazonaws.com/loaddatareport:dcee4440afe80da9c41a20d96fb2f788477cc7ac
```




### **COMPCATALOG**

```bash
kubectl -n bysidecar-pre set image deployments/compcatalog compcatalog=952729869933.dkr.ecr.eu-west-1.amazonaws.com/comp-catalog:abc5d0c347c775cf992a88a20ad42424c9621ae6
```




### **ENDESA-WEB**
[PRE]
```bash
kubectl -n endesa-pre set image deployments/endesa-web-pre endesa-web=952729869933.dkr.ecr.eu-west-1.amazonaws.com/endesa-web-pre:09e023446bfc25cc04c618a2c2d6a0db08677da0
```

[PRO]
```bash
kubectl -n endesa set image deployments/endesa-endesa-web endesa-web=952729869933.dkr.ecr.eu-west-1.amazonaws.com/endesa-web:09e023446bfc25cc04c618a2c2d6a0db08677da0
```



### **KINKON-BLOG**
[PRE]
```bash
kubectl -n euskaltel-pre set image deployments/euskaltel-blog-pre euskaltel-blog-pre=952729869933.dkr.ecr.eu-west-1.amazonaws.com/euskaltel_blog:d78e428a3931a198a795a7dad2e4273b3e0ea343
```

[PRO]
```bash
```

 




## Analisis nombres para deploys

```bash
kubectl -n ['nombre_namespace'] set image deployments/['nombre_deployment'] ['nombre_container']=['url_AWS']/['ecr_repo']:['commit_id']
```

> **repo_docker** => `nombre repositorio docker`: nombre repo github ó consultar nombre en AWS => ECR/repositories

> **nombre_namespace** => `abanca-pre`: consultar describe pod .... => Namespace:

> **nombre_deployment** => `abanca-endtoend-website-pre`: kubectl -n [namespace] get deployment

> **nombre_container**  => `abanca-end2end-website`: consultar describe pod .... => Containers:

> **ecr_repo**       => `abanca-endtoend-website-pre`: consultar nombre en AWS => ECR/repositories




## CERTIFICATES

### Create certificate

```bash
kubectl -n [namespace] create -f certificate-definition.yml
```

### Example of certificate-definition.yml

```yml
apiVersion: certmanager.k8s.io/v1alpha1
kind: Certificate
metadata:
  name: googlehook-pre-bysidecar-me
  namespace: bysidecar-pre
spec:
  secretName: tls-googlehook-pre
  issuerRef:
    name: letsencrypt
    kind: ClusterIssuer
  commonName: googlehook-pre.bysidecar.me
  dnsNames:
  - googlehook-pre.bysidecar.me
  acme:
    config:
    - dns01:
        provider: aws-route53
      domains:
      - googlehook-pre.bysidecar.me
```

This will create a certificate and the its tls secret.

### Get certificates

```bash
kubectl -n [namespace] get certificate
```



## SECRETS

### Get secret

```bash
kubectl -n [namespace] get secret
```

### Describe secret

```bash
kubectl -n [namespace] describe secret  tls-googlehook-pre
```

### Create a secret

```bash
kubectl -n [namespace] create secret generic [name_of_secret] --from-literal=[KEY]=[VALUE] --from-literal=[KEY]=[VALUE] --from-literal=[KEY]=[VALUE]
# --from-literal=username=devuser --from-literal=password='XXXXXX'
```

Use it in a definition file:

```yml
env:
  - name: DB_USER # name of variable in the code
    valueFrom:
      secretKeyRef:
        name: leads-database  # [name_of_secret]
        key: user             # [KEY]
```


## TIP

To set the correct port for an app like googlehook or similar, edit the deployment template in helm and set the containerport to the desired port-



## REPLICAS

- Scale deployment to a number of replicas

```bash
kubectl -n [namespace] scale --replicas=[X] deployment [deployment_name]
```



## JOBS

You can't rerun a job, you have to delete it and create it again

### Apply

```bash
kubectl -n bysidecar-pre apply -f ci/job-definition.yml
```

### List jobs

```bash
kubectl -n bysidecar-pre get jobs
```

### Describe job

```bash
kubectl -n bysidecar-pre describe jobs/untraceable-job
```

### Logs job

```bash
kubectl -n bysidecar-pre logs jobs/untraceable-job
```

### Delete jobs

```bash
kubectl -n bysidecar-pre delete job/untraceable-job
```



## CRONJOBS

### Apply cronjob

```bash
kubectl -n bysidecar-pre apply -f ci/cronjob-definition.yml
```

### List cronjobs

```bash
kubectl -n bysidecar-pre get cronjobs
```

### Describe cronjobs

```bash
kubectl -n bysidecar-pre describe cronjob/untraceable-cronjob
```

### Logs cronjobs

```bash
kubectl -n bysidecar-pre logs jobs/untraceable-job
```

### Delete cronjobs

```bash
kubectl -n bysidecar-pre delete cronjob/untraceable-cronjob
```

## INGRESS

### Update an ingress without upgrading deployment

```sh
kubectl -n [namespace] edit ingress [ingress_name]
```