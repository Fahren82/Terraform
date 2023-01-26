resource "azurerm_resource_group" "rs-diplo-server" {
    name = var.rs_name
    location = var.rs_location
    tags = {
      "diplomado" = var.rs_diplomado
    }
}

resource "azurerm_virtual_network" "vnet-terra" {
    name = var.vnet_name
    address_space = var.vnet_address_space
    location = azurerm_resource_group.rs-diplo-server.location
    resource_group_name = azurerm_resource_group.rs-diplo-server.name
}

resource "azurerm_subnet" "subnet-terra" {
    name = var.subnet_name
    resource_group_name = azurerm_resource_group.rs-diplo-server.name
    virtual_network_name = azurerm_virtual_network.vnet-terra.name
    address_prefixes = var.subnet_address_prefixes
}

resource "azurerm_container_registry" "acr-terra" {
    name = var.acr_name
    resource_group_name = azurerm_resource_group.rs-diplo-server.name
    location = azurerm_resource_group.rs-diplo-server.location
    sku = var.acr_sku
    admin_enabled = var.acr_admin_enabled
}

resource "azurerm_kubernetes_cluster" "aks-terra" {
    name = var.aks_name
    location = azurerm_resource_group.rs-diplo-server.location
    resource_group_name = azurerm_resource_group.rs-diplo-server.name
    dns_prefix = var.aks_dns_prefix
    kubernetes_version = var.aks_kubernetes_version
    role_based_access_control_enabled = var.aks_rbac_enabled

    default_node_pool {
      name = var.aks_np_name
      node_count = var.aks_np_node_count
      vm_size = var.aks_np_vm_size
      vnet_subnet_id = azurerm_subnet.subnet-terra.id
      enable_auto_scaling = var.aks_np_enabled_auto_scaling
      max_count = var.aks_np_max_count
      min_count = var.aks_np_min_count
    }

    service_principal {
      client_id = var.aks_sp_client_id
      client_secret = var.aks_sp_client_secret
    }
  
  network_profile {
    network_plugin = var.aks_net_plugin
    network_policy = var.aks_net_policy
  }
}

resource "azurerm_kubernetes_cluster_node_pool" "addnode" {
  name = var.np_add_name
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks-terra.id
  vm_size = var.np_add_vm_size
  node_count = 1
  max_pods = var.np_add_maxpod

  tags = {
    "diplomado2" = var.np_add_tag
  }
}