# HELM
Helm is our system to package and deploy applications on BySidecar Kubernetes cluster.

![Helm](https://s3-eu-west-1.amazonaws.com/public.bysidecar.me/assets/helm/logo/helm.png)

As you may check on [Helm's docs](https://docs.helm.sh/). Helm have two pieces, first, a CLI that uses your Kubernetes config to perform package managing operations (deploy, delete, update, etc), the CLI is able to perform those actions because the second piece, is named Tiller and its the system that manages the packages deployed.

## Installation
In order to install Helm on your cluster, perform the following operations:

### Create Helm RBAC account
Helm need permissions to manage Kubernetes resources, so first you would need to create a RBAC account with admin permissions.

This folder contains the RBAC file that would provide Helm with those permissions, use the following command to configure it.
```bash
kubectl create -f rbac.yaml
```
