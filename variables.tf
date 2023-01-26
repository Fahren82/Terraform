# Resource Group
variable "rs_name" {}
variable "rs_location" {}
variable "rs_group" {}
variable "rs_diplomado" {}

# Virtual Network
variable "vnet_name" {}
variable "vnet_address_space" {}

# Subnet
variable "subnet_name" {}
variable "subnet_address_prefixes" {}

# Container Registry
variable "acr_name" {}
variable "acr_sku" {}
variable "acr_admin_enabled" {}

# Kubernetes Service
variable "aks_name" {}
variable "aks_dns_prefix" {}
variable "aks_kubernetes_version" {}
variable "aks_rbac_enabled" {}
variable "aks_np_name" {}
variable "aks_np_node_count" {}
variable "aks_np_vm_size" {}
variable "aks_np_enabled_auto_scaling" {}
variable "aks_np_max_count" {}
variable "aks_np_min_count" {}
variable "aks_sp_client_id" {}
variable "aks_sp_client_secret" {}
variable "aks_net_plugin" {}
variable "aks_net_policy" {}

#Additional Node
variable "np_add_name" {}
variable "np_add_vm_size" {}
variable "np_add_tag" {}
variable "np_add_max_count" {}
variable "np_add_min_count" {}
variable "np_add_maxpod" {}
#variable "" {}
#variable "" {}
#variable "" {}
#variable "" {}
#variable "" {}
#variable "" {}
