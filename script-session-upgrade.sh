#!/bin/bash
rm -r ~/tanzu
mkdir $HOME/tanzu
cd $HOME/tanzu
mv ~/tkg151/tanzu-cli-bundle-linux-amd64.tar.gz $HOME/tanzu
mv ~/tkg151/kubectl-linux-v1.22.5+vmware.1.gz $HOME/tanzu
rm ~/.config/tanzu/tkg/compatibility/tkg-compatibility.yaml
echo "################# Extracting the files ###################"
gunzip tanzu-cli-bundle-linux-amd64.tar.gz
tar -xvf tanzu-cli-bundle-linux-amd64.tar
gunzip kubectl-linux-v1.22.5+vmware.1.gz
cd $HOME/tanzu/cli
echo "################ Installing Tanzu CLI ###################"
sudo install core/v0.11.1/tanzu-core-linux_amd64 /usr/local/bin/tanzu
tanzu init
tanzu version
tanzu plugin sync
tanzu plugin list
cd ~/tanzu
chmod ugo+x kubectl-linux-v1.22.5+vmware.1
sudo install kubectl-linux-v1.22.5+vmware.1 /usr/local/bin/kubectl
cd /home/azureuser/tanzu/cli
gunzip ytt-linux-amd64-v0.35.1+vmware.1.gz
gunzip kapp-linux-amd64-v0.42.0+vmware.1.gz
gunzip kbld-linux-amd64-v0.31.0+vmware.1.gz
gunzip imgpkg-linux-amd64-v0.18.0+vmware.1.gz
chmod ugo+x ytt-linux-amd64-v0.35.1+vmware.1
chmod ugo+x imgpkg-linux-amd64-v0.18.0+vmware.1
chmod ugo+x kapp-linux-amd64-v0.42.0+vmware.1
chmod ugo+x kbld-linux-amd64-v0.31.0+vmware.1
sudo mv ./ytt-linux-amd64-v0.35.1+vmware.1 /usr/local/bin/ytt
sudo mv ./kapp-linux-amd64-v0.42.0+vmware.1 /usr/local/bin/kapp
sudo mv ./kbld-linux-amd64-v0.31.0+vmware.1 /usr/local/bin/kbld
sudo mv ./imgpkg-linux-amd64-v0.18.0+vmware.1 /usr/local/bin/imgpkg
sed -i -r "s/data.values.AZURE_CLIENT_SECRET/"'"Zye7Q~7KNII0enBhf2QFtuKI6WmdA64DKl.M3"'"/g" "/home/azureuser/.config/tanzu/tkg/providers/infrastructure-azure/v1.0.1/ytt/overlay.yaml"
echo "################# Verify Tanzu CLI version ###################"
tanzu version
echo "################# Verify Kubectl version ###################"
kubectl version
echo "################# Verify imgpkg version ###################"
imgpkg --version
echo "################# Verify kapp version ###################"
kapp --version
echo "################# Verify kbld version  ###################"
kbld --version
echo "################# Verify ytt version  ###################"
ytt --version
