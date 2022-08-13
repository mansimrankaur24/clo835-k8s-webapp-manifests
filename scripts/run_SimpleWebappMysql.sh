#!/bin/sh
echo "\n--------------------------------------"
echo "*** Installing Simple Webapp MySQL ..."
echo "--------------------------------------\n"

kubectl create ns final
kubectl apply -f ../mysql-pvc.yaml -n final
kubectl apply -f ../mysql-secrets.yaml -n final
kubectl apply -f ../mysql-deployment.yaml -n final
kubectl apply -f ../mysql-service.yaml -n final
kubectl apply -f ../webapp-configmap.yaml -n final
./serviceaccount-iam-role.sh
kubectl apply -f ../service-account-definition.yaml -n final
kubectl apply -f ../serviceaccount-role.yaml -n final
kubectl apply -f ../serviceaccount-rolebinding.yaml -n final
kubectl apply -f ../webapp-deployment.yaml -n final
kubectl apply -f ../webapp-service.yaml -n final
# kubectl apply -f ../webapp-service-np.yaml -n final
# kubectl apply -f ../mysql-pod-definition.yaml -n final
# kubectl apply -f ../webapp-pod-definition.yaml -n final
sleep 10

echo "\n--------------------------------------------"
echo "*** All services installed successfully. ***"
echo "--------------------------------------------\n"
kubectl get all -n final

