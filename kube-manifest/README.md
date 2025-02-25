# Kubernetes Manifest

This repository contains the Kubernetes manifests for the applications deployed in our Kubernetes cluster. The manifests are used by ArgoCD as a single source of truth for our GitOps workflow.

## Directory Structure

The manifests are organized into a single directory called `kube_manifest`. The following manifests are available:

- `deployment.yaml`: manifest for the deployment of the application
- `service.yaml`: manifest for the service that exposes the application

In addition, the repository includes an `argocd-sync.yaml` file that defines the ArgoCD application that syncs the manifests with the Kubernetes cluster.

## Usage

To deploy the manifests, you can use ArgoCD to sync the `kube_manifest` directory with the Kubernetes cluster. ArgoCD will automatically apply any changes to the manifests and ensure that the desired state of the cluster matches the manifests in the repository.

## Contributing

If you would like to contribute to the manifests in this repository, please fork the repository and submit a pull request with your changes. All changes must be reviewed and approved by a member of the team before they can be merged into the repository.
