#!/bin/sh
kubectl config delete-context eduk8s
mv ~/config ~/.kube/config
mv ~/jb_instance ~/.kube/jb_instance
#tanzu login --kubeconfig ~/.kube/config --context partnerse-demo-mgmt-admin@partnerse-demo-mgmt --name partnerse-demo-mgmt
#kubectl config set-context partnerse-demo-mgmt-admin@partnerse-demo-mgmt
#kubectl config use-context partnerse-demo-mgmt-admin@partnerse-demo-mgmt
#kubectl config get-contexts
#tanzu mc get
