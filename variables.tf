
variable "gitops_config" {
  type        = object({
    boostrap = object({
      argocd-config = object({
        project = string
        repo = string
        url = string
        path = string
      })
    })
    infrastructure = object({
      argocd-config = object({
        project = string
        repo = string
        url = string
        path = string
      })
      payload = object({
        repo = string
        url = string
        path = string
      })
    })
    services = object({
      argocd-config = object({
        project = string
        repo = string
        url = string
        path = string
      })
      payload = object({
        repo = string
        url = string
        path = string
      })
    })
    applications = object({
      argocd-config = object({
        project = string
        repo = string
        url = string
        path = string
      })
      payload = object({
        repo = string
        url = string
        path = string
      })
    })
  })
  description = "Config information regarding the gitops repo structure"
}

variable "git_credentials" {
  type = list(object({
    repo = string
    url = string
    username = string
    token = string
  }))
  description = "The credentials for the gitops repo(s)"
  sensitive   = true
}

variable "namespace" {
  type        = string
  default = "gitops-cp-cp4ba-operator"
  description = "The namespace where the application should be deployed" 
}

variable "kubeseal_cert" {
  type        = string
  description = "The certificate/public key used to encrypt the sealed secrets"
  default     = ""
}

variable "server_name" {
  type        = string
  description = "The name of the server"
  default     = "default"
}
variable "channel" {
  type        = string
  description = "The channel that should be used to deploy the operator"
  default     = "v21.3"
}
variable "catalog" {
  type        = string
  description = "The catalog source that should be used to deploy the operator"
  default     = "ibm-operator-catalog"  
  
}
variable "catalog_namespace" {
  type        = string   
  description = "The namespace where the catalog has been deployed"
  default     = "openshift-marketplace"
}
variable "storageclass_operator" {
  type        = string
  #default="cp4a-file-retain-gold-gid"
  #default="ibmc-vpc-block-metro-retain-10iops-tier"
  default="portworx-db2-rwx-sc"
  description = "The storge class for operator pvc"
}
variable "storage_class_gold_name" {
  type        = string
  default="cp4a-file-retain-gold-gid"
  description = "The storge class for the fast acces"
}
variable "storage_class_silver_name" {
  type        = string
  default="cp4a-file-retain-silver-gid"
  description = "The storge class for the medium access"
}
variable "storage_class_bronze_name" {
  type        = string
  default="cp4a-file-retain-bronze-gid"
  description = "The storge class for the slow access"
}
variable "docker_username" {
  type        = string
  default="cp"
  description = "docker-username"
}
variable "docker_password" {
  type        = string
  default="eyJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJJQk0gTWFya2V0cGxhY2UiLCJpYXQiOjE1ODU4MDgyNDYsImp0aSI6IjkyYmFjY2YxYzAwYTQ1MDBhYTc3OTJmYWE2OTNhMzgzIn0.bTjCyzArfW_e1hoakIO2B6mt12fV3P3FibVz2O1gT3A"
  description = "docker-password"
}
variable "docker_server" {
  type        = string
  default="cp.icr.io"
  description = "docker-server"
}
variable "docker_email" {
  type        = string
  default="dineshchandrapandey@in.ibm.com"
  description = "docker-email"
}
variable "registry_key_name" {
  type        = string
  default="admin.registrykey"
  description = "registry_key_name"  
}
variable "cp_entitlement_key" {
  type        = string
  default="eyJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJJQk0gTWFya2V0cGxhY2UiLCJpYXQiOjE1ODU4MDgyNDYsImp0aSI6IjkyYmFjY2YxYzAwYTQ1MDBhYTc3OTJmYWE2OTNhMzgzIn0.bTjCyzArfW_e1hoakIO2B6mt12fV3P3FibVz2O1gT3A"
  description = "docker-password"
}