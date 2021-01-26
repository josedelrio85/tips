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
kubectl -n euskaltel-pre set image deployments/euskaltel-kinkon-web-pre euskaltel-kinkon-web=952729869933.dkr.ecr.eu-west-1.amazonaws.com/euskaltel-kinkon-web-pre:59f53323f3e62b95f6bc074b85ac7bf3c26380af
```

[PRO]
```bash
kubectl -n euskaltel set image deployments/euskaltel-kinkon-web euskaltel-kinkon-web=952729869933.dkr.ecr.eu-west-1.amazonaws.com/euskaltel-kinkon-web-pro:9bf21250c73e5e67b43cdf0333b7dc9c3abdca52
```




### **RUEIRO**
[PRE]
```bash
kubectl -n bysidecar-pre set image deployments/rueiro-pre rueiro=952729869933.dkr.ecr.eu-west-1.amazonaws.com/rueiro:d69bd295f44737c9d7f50eff6cbc71fd3059d988
```

[PRO]
```bash
kubectl -n bysidecar set image deployments/rueiro rueiro=952729869933.dkr.ecr.eu-west-1.amazonaws.com/rueiro:d69bd295f44737c9d7f50eff6cbc71fd3059d988
```




### **LEADS**
[PRE]
```bash
kubectl -n bysidecar-pre set image deployments/leads-pre leads=952729869933.dkr.ecr.eu-west-1.amazonaws.com/leads:dfe66f1d26c805f762c9b396cd292523b427e418
```

[PRO]
```bash
kubectl -n bysidecar set image deployments/leads leads=952729869933.dkr.ecr.eu-west-1.amazonaws.com/leads:dfe66f1d26c805f762c9b396cd292523b427e418
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
kubectl -n bysidecar-pre set image deployments/googlehook-pre googlehook=952729869933.dkr.ecr.eu-west-1.amazonaws.com/googlehook:9e921f35152898184868d745498a3e88ba2273d4
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
kubectl -n euskaltel-pre set image deployments/kinkon-empresas-pre kinkon-empresas=952729869933.dkr.ecr.eu-west-1.amazonaws.com/kinkon-empresas-pre:01a84128678cc066ee665129378348bdcb4fa690
```

[PRO]
```bash
kubectl -n euskaltel set image deployments/kinkon-empresas kinkon-empresas=952729869933.dkr.ecr.eu-west-1.amazonaws.com/kinkon-empresas-pro:68a718f8589e892ff85a5ca6775fd95617c3b88b
```





### **ADESLAS-WEB**
[PRE]
```bash
kubectl -n adeslas-pre set image deployments/adeslas-web-pre adeslas-web=952729869933.dkr.ecr.eu-west-1.amazonaws.com/adeslas-web-pre:2ab513a6734afd30e3a46f4927a3b857ea2b9ca6
```

[PRO]
```bash
kubectl -n adeslas set image deployments/adeslas-web adeslas-web=952729869933.dkr.ecr.eu-west-1.amazonaws.com/adeslas-web:04dcee6066cf4a17c35916b4211591fc77c5f8ed
```





### **VIRGIN-BLOG**
[PRE]
```bash
kubectl -n virgin-pre set image deployments/virgin-blog-pre virgin-blog-pre=952729869933.dkr.ecr.eu-west-1.amazonaws.com/virgin_blog:aefde53f22879c67a4ad002ef3a71d5958e3c88a
```

[PRO]
```bash
kubectl -n virgin set image deployments/virgin-blog virgin-blog=952729869933.dkr.ecr.eu-west-1.amazonaws.com/virgin_blog:21bf3efec9e83cf85ce4947aa9a8777c5f1cdf87
```




### **VIRGIN-WEB**
[PRE]
```bash
kubectl -n virgin-pre set image deployments/virgin-web-pre virgin-web-pre=952729869933.dkr.ecr.eu-west-1.amazonaws.com/virgin-web-pre:12520c1fa99b4ad41c00c279966aa0a545c2614a
```

[PRO]
```bash
kubectl -n virgin set image deployments/virgin-web virgin-web=952729869933.dkr.ecr.eu-west-1.amazonaws.com/virgin-web:12520c1fa99b4ad41c00c279966aa0a545c2614a
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
kubectl -n endesa-pre set image deployments/endesa-web-pre endesa-web=952729869933.dkr.ecr.eu-west-1.amazonaws.com/endesa-web-pre:af9faee6a2cbcbab5e17601e02ab67b7c04b9bd7
```

[PRO]
```bash
kubectl -n endesa set image deployments/endesa-endesa-web endesa-web=952729869933.dkr.ecr.eu-west-1.amazonaws.com/endesa-web:af9faee6a2cbcbab5e17601e02ab67b7c04b9bd7
```



### **KINKON-BLOG**
[PRE]
```bash
kubectl -n euskaltel-pre set image deployments/euskaltel-blog-pre euskaltel-blog-pre=952729869933.dkr.ecr.eu-west-1.amazonaws.com/euskaltel_blog:52204e67b8d93de370df07af138a7a3c7f13d47b
```

[PRO]
```bash
kubectl -n euskaltel set image deployments/euskaltel-blog euskaltel-blog=952729869933.dkr.ecr.eu-west-1.amazonaws.com/euskaltel_blog:49fafde27d1d80f093fb23f92c76feab21a6997f
```

 
### **WHITE-COMPARATOR**
[PRE]
```bash
kubectl -n white-comparator-pre set image deployments/white-comparator-pre white-comparator=952729869933.dkr.ecr.eu-west-1.amazonaws.com/white-comparator-pre:3b673601e836d3a2d640f992cff0e6cc41e238a1
```

[PRO]
```bash
kubectl -n white-comparator set image deployments/white-comparator white-comparator=952729869933.dkr.ecr.eu-west-1.amazonaws.com/white-comparator-pre:3b673601e836d3a2d640f992cff0e6cc41e238a1
```


### **CHECKOPERATOR**
[PRE]
```bash
kubectl -n bysidecar-pre set image deployments/checkoperator-pre checkoperator=952729869933.dkr.ecr.eu-west-1.amazonaws.com/checkoperator:933a89899c6acc9d317c0b5b7fe81bf57f68a7e9
```

[PRO]
```bash
kubectl -n bysidecar set image deployments/checkoperator checkoperator=952729869933.dkr.ecr.eu-west-1.amazonaws.com/checkoperator:933a89899c6acc9d317c0b5b7fe81bf57f68a7e9
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

## ADD ENV VAR TO DEPLOYED DEPLOYMENT

```sh
# Update deployment 'registry' with a new environment variable
kubectl set env deployment/registry STORAGE_DIR=/local
  
# List the environment variables defined on a deployments 'sample-build'
kubectl set env deployment/sample-build --list
```


## EXEC

### Get into a pod

```bash
kubectl -n [namespace] exec --stdin --tty [pod_name] -- /bin/bash

#Note: The double dash (--) separates the arguments you want to pass to the command from the kubectl arguments.
```