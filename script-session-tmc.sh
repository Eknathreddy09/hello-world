#!/bin/sh
scp -i ~/id_rsa -o StrictHostKeyChecking=accept-new azureuser@$VMIP:~/.kube/config ~/.kube/config
username=$(kubectl config view -o jsonpath={.users[0].name})
clustername=$(kubectl config view -o jsonpath={.contexts[0].context.cluster})
tanzu login --kubeconfig ~/.kube/config --context $username@$clustername --name $clustername
kubectl config set-context $username@$clustername
kubectl config use-context $username@$clustername
sed -i -r "s/harborurl/$SESSION_NAME/g" ~/harbor.yaml
