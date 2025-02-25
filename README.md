# To-do App

> This repository containe the code of a React application called Todo-app. I've created this to Deploy it on an Azure Kubernetes cluster using the GitOps approach for continous deployment.✨

> This is a SPA react-app project. A To-do app that let's user to schedule, add, delete and mark completed daily tasks. 


## Built With

- HTML5
- CSS3
- JavaScript
- React
- React-redux
- Webpack
- Jest

## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites

You must have a browser on your device, visual code, a git version, [node.js](https://nodejs.org/en/) installed in your device and clone the repo from GitHub ()and follow the steps below.

### Setup

Clone the repository from GitHub, open the project folder, inside the project direcory open the commanline or Terminal and install the dependicies.

### Install

inside the project direcory open the commanline or Terminal, run npm install to install all the dependicies.

### Usage

To use this project or app run npm start in the project directory and you will see the live serever open on youe browser.

### Run tests

For running tests inside the project directory run npm test in command line or Terminal.

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Inspiration
- etc
---

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
