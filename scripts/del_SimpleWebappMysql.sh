#!/bin/sh

echo "\n------------------------------------"
echo "*** Removing Simple Webapp MySQL ..."
echo "------------------------------------\n"

kubectl delete -f ../mysql-secrets.yaml -n final
kubectl delete -f ../mysql-deployment.yaml -n final
kubectl delete -f ../mysql-service.yaml -n final
kubectl delete -f ../webapp-configmap.yaml -n final
kubectl delete -f ../webapp-deployment.yaml -n final
kubectl delete -f ../mysql-pvc.yaml -n final
kubectl delete -f ../service-account-definition.yaml -n final
kubectl delete -f ../serviceaccount-role.yaml -n final
kubectl delete -f ../serviceaccount-rolebinding.yaml -n final
kubectl delete -f ../webapp-service.yaml -n final
aws iam delete-role-policy --role-name clo835-service-account-role --policy-name SA-S3ReadAccess
aws iam delete-role --role-name clo835-service-account-role
kubectl delete ns final
sleep 3

echo "\n------------------------------------------"
echo "*** All services removed successfully. ***"
echo "------------------------------------------\n"
kubectl get all -n final

