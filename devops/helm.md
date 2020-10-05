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
helm -n [namespace] install [name] [path_helm_package] -f [path_helm_values_file]
```

```bash
helm -n [namespace_name] install [name] helm-package\ \
-f helm-package\values-pre.yaml | -f helm-package\values-pro.yaml
```

## Upgrade

```bash
helm -n [namespace] upgrade [name] [path_helm_package]

#or with config file

helm -n [namespace] upgrade [name] [path_helm_package] -f [path_helm_values_file]
```

## List helm charts

```bash
helm -n [namespace_name] ls --all
```

## Rollback

```bash
helm rollback [helm_name] [revision_number]
```

## Delete

```bash
helm delete [helm_name]
```