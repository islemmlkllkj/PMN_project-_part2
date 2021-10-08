#! / Bin / bash
# Create the cluster with
kind create cluster --config kind_config/config.yaml
sleep "40s"

#To check the created cluster
kind get clusters
sleep "40s"
#To check the nodes
kubectl get nodes
# --> Show nodes informations (`-o wide` for more information)

#To create volumes
kubectl apply -f volumes/dolibarr-conf-persistentvolumeclaim.yaml
sleep "10s"
kubectl apply -f volumes/dolibarr-docs-persistentvolumeclaim.yaml
sleep "10s"
kubectl apply -f volumes/mariadb-persistentvolumeclaim.yaml
sleep "30s"

#To create deployments
kubectl apply -f deployments/dolibarr-deployment.yaml
sleep "10s"
kubectl apply -f deployments/mariadb-deployment.yaml
sleep "30s"

#To create services
kubectl apply -f services/dolibarr-service.yaml
sleep "10s"
kubectl apply -f services/mariadb-service.yaml
sleep "30s"

#To check the deployments
kubectl get deployments
sleep "30s"

#To check the volumes
kubectl get pvc
sleep "30s"

#To check the services
kubectl get svc
sleep "30s"

#To check the pods
kubectl get pods
sleep "30s"
# --> Show the pods informations (`-o` wide for more information)


