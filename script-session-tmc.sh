### To be changed - IP

scp -i ~/id_rsa -o StrictHostKeyChecking=accept-new azureuser@52.140.0.80:~/.kube/config ~/.kube/config
#tanzu login --kubeconfig ~/.kube/config --context partnerse-demo-mgmt-admin@partnerse-demo-mgmt --name partnerse-demo-mgmt
#kubectl config set-context partnerse-demo-mgmt-admin@partnerse-demo-mgmt
#kubectl config use-context partnerse-demo-mgmt-admin@partnerse-demo-mgmt
#kubectl config get-contexts
#tanzu mc get
