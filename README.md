```
### How to Deploy & Connect to the cheapest possible managed k8s cluster with Terraform.  
#### Checkout https://k8slens.dev/ for a nice IDE to manage multiple clusters  
  
#### Install Azure CLI & Login - Ubuntu  
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash  
az login  
  
#### Terraform Steps  
terraform init  
terraform plan  
terraform apply  
  
#### Manually get Credentials for AKS cluster1-aks1  
az aks get-credentials --name sg-dev-cluster1-aks1 --resource-group sg-dev-cluster1-resources  


#### Flux Setup -> 
export GITHUB_TOKEN=<your-token> # requires repo permissions(classic token method)
export GITHUB_USER=<your-username>
export GITHUB_REPO=<repository-name>

flux check --pre

flux bootstrap github \
    --context=sg-dev-cluster1-aks1 \
    --owner=${GITHUB_USER} \
    --repository=${GITHUB_REPO} \
    --branch=main \
    --personal \
    --path=clusters/staging
    
```
