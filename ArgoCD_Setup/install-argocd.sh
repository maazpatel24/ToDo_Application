#!/bin/bash

set -e  # 🚨 Exit immediately if a command fails

echo "🚀 Creating ArgoCD namespace..."
kubectl create namespace argocd || echo "⚠️ Namespace already exists."

echo "📥 Installing ArgoCD..."
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

echo "🌐 Exposing ArgoCD via LoadBalancer..."
kubectl patch svc argocd-server -n argocd --type='merge' -p '{"spec": {"type": "LoadBalancer"}}'

# ⏳ Wait for the LoadBalancer to get an IP
echo "⏳ Waiting for LoadBalancer IP..."
while true; do
  ARGOCD_SERVER=$(kubectl get svc argocd-server -n argocd -o json | jq --raw-output '.status.loadBalancer.ingress[0].ip' 2>/dev/null || echo "")
  if [[ -n "$ARGOCD_SERVER" && "$ARGOCD_SERVER" != "null" ]]; then
    break
  fi
  echo "🔄 Waiting for external IP..."
  sleep 5
done

echo "✅ ARGOCD_SERVER IP: $ARGOCD_SERVER"

echo "🔐 Retrieving ArgoCD initial admin password..."
while true; do
  ARGOCD_PASSWORD=$(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" 2>/dev/null | base64 -d || echo "")
  if [[ -n "$ARGOCD_PASSWORD" ]]; then
    break
  fi
  echo "🔄 Waiting for secret to be available..."
  sleep 5
done

echo "🔑 ARGOCD_SERVER PASSWORD: $ARGOCD_PASSWORD"

echo "🚀 Login to ArgoCD using:"
echo "💻 argocd login $ARGOCD_SERVER --username admin --password $ARGOCD_PASSWORD --insecure"

echo "🎉 ArgoCD setup completed successfully! 🎊"

exit 0
