#!/bin/bash
 
echo "Create a local Kubernetes cluster"
k3d cluster create samundra
 
echo"Addding a worker node to the cluster"
k3d node create test0 --cluster samundra
 
echo "Deploying Wordpress to the cluster"
kubectl apply -f deployment.yaml
kubectl apply -f mysql.yaml
 
echo "Verify the deployment"
kubectl get deployments
kubectl get pods
kubectl get svc
