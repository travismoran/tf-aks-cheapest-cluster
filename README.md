### How to Deploy & Connect to the cheapest possible managed k8s cluster with Terraform.  
#### Checkout https://k8slens.dev/ for a nice IDE to manage multiple clusters  
  
#### Install Azure CLI & Login - Ubuntu  
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash  
az login  
  
#### Terraform Steps  
terraform15 init  
terraform15 plan  
terraform15 apply  
  
#### Manually get Credentials for AKS cluster1-aks1  
az aks get-credentials --name sg-dev-cluster1-aks1 --resource-group sg-dev-cluster1-resources  
