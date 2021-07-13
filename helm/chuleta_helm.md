# Chuleta Helm

## Create helm chart

```bash
helm create helm-package
```

## Check resultant template

```bash
helm template helm-package
```

## Validate template

```bash
helm lint helm-package
```

## Fake install

```bash
helm install --dry-run --debug --namespace [namespace_name] helm-package
```

## Install

```bash
helm install --name [name] --namespace [namespace_name] helm-package
```

## List helm charts

```bash
helm ls --all
```

## Rollback

```bash
helm rollback [helm_name] [revision_number]
```

## Delete

```bash
helm delete [helm_name]
```

# Create certificate

```bash
kubectl -n [namespace] create -f certificate-definition.yml
```

## Example of certificate-definition.yml

```yml
apiVersion: certmanager.k8s.io/v1alpha1
kind: Certificate
metadata:
  name: googlehook-pre-josedelrio85-me
  namespace: josedelrio85-pre
spec:
  secretName: tls-googlehook-pre
  issuerRef:
    name: letsencrypt
    kind: ClusterIssuer
  commonName: googlehook-pre.josedelrio85.me
  dnsNames:
  - googlehook-pre.josedelrio85.me
  acme:
    config:
    - dns01:
        provider: aws-route53
      domains:
      - googlehook-pre.josedelrio85.me
```

This will create a certificate and the its tls secret.

## Get certificates

```bash
kubectl -n [namespace] get certificate
```

## Get secret

```bash
kubectl -n [namespace] get certificate
```

## Describe secret

```bash
kubectl -n [namespace] describe secret  tls-googlehook-pre
```

## TIP

To set the correct port for an app like googlehook or similar, edit the deployment template in helm and set the containerport to the desired port-

## Create a secret

```bash
kubectl create secret generic abanca-api-auth --from-literal=auth-clientid=-from-literal=auth-key=xxx --from-literal=auth-user=Bysidcar --from-literal=auth-pass=xxx --namespace abanca-pre
```
