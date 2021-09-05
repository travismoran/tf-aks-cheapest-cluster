provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "sg-dev-cluster1" {
  name     = "sg-dev-cluster1-resources"
  location = "West US"
}

resource "azurerm_kubernetes_cluster" "sg-dev-cluster1" {
  name                = "sg-dev-cluster1-aks1"
  location            = azurerm_resource_group.sg-dev-cluster1.location
  resource_group_name = azurerm_resource_group.sg-dev-cluster1.name
  dns_prefix          = "sg-dev-cluster1aks1"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B2s"
    os_disk_size_gb = "32"
  }

 network_profile {
    network_plugin = "azure"
    load_balancer_sku = "basic"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Development"
  }
}

output "client_certificate" {
  value = azurerm_kubernetes_cluster.sg-dev-cluster1.kube_config.0.client_certificate
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.sg-dev-cluster1.kube_config_raw

  sensitive = true
}