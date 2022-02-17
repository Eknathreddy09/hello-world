#!/bin/sh
### Update the password during partner demo
kubectl config delete-context eduk8s
#mv ~/config ~/.kube/config
curl https://raw.githubusercontent.com/Eknathreddy09/hello-world/master/jb_instance -o ~/id_rsa
chmod 700 ~/id_rsa
azportallogin=$(az login --service-principal -u c35f2d8b-1e51-4aba-ac3e-f9135baf97c1 -p Zye7Q~7KNII0enBhf2QFtuKI6WmdA64DKl.M3 --tenant b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0)
vmcreate=$(az vm create -g jumpbox-RG -n $SESSION_NAME --image /subscriptions/827ba431-f0b2-4e6b-aa9b-45d645395244/resourceGroups/jumpbox-RG/providers/Microsoft.Compute/images/templatevmprepare-image-20220216162149 --size Standard_DS2_v2 --ssh-key-values id_rsa.pub)
VMIPs=$(az vm list-ip-addresses --resource-group jumpbox-RG --name $SESSION_NAME --query "[].virtualMachine.network.publicIpAddresses[0].ipAddress" --output tsv)
export VMIP=$VMIPs
az vm open-port --resource-group jumpbox-RG --name $SESSION_NAME --port 8080
echo "Connect to public ip: $VMIP to create management cluster in Terminal 2"
echo "$VMIP"
