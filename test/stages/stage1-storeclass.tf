module "cp4a-file-retain-gold-gid" {
  source = "github.com/cloud-native-toolkit/terraform-gitops-ocp-storageclass"

  gitops_config = module.gitops.gitops_config
  git_credentials = module.gitops.git_credentials
  server_name = module.gitops.server_name
  
  name="cp4a-file-retain-gold-gid"
  provisioner_name="vpc.block.csi.ibm.io"

  parameter_list=[{key = "classVersion",value = "1"},{key = "csi.storage.k8s.io/fstype", value = "ext4"}, {key="encrypted",value="false"},{key="profile",value="10iops-tier"},{key="sizeRange",value="[10-2000]GiB]"}]

}

resource null_resource gitops_sc_output {
  provisioner "local-exec" {
    command = "echo -n 'cp4a-file-retain-gold-gid' > git_sc_name_gold"
  }

}

module "cp4a-file-retain-bronze-gid" {
  source = "github.com/cloud-native-toolkit/terraform-gitops-ocp-storageclass"

  gitops_config = module.gitops.gitops_config
  git_credentials = module.gitops.git_credentials
  server_name = module.gitops.server_name
  
  name="cp4a-file-retain-bronze-gid"
  provisioner_name="ibm.io/ibmc-file"
  vol_binding_mode="Immediate"
  reclaim_policy="Retain"
  parameter_list=[{key="type", value="Endurance"},{key = "iopsPerGB",value = "2"},{key = "sizeRange", value = "[20-12000]GiGi"},{key="billingType",value="hourly"},{key="classVersion",value="2"},{key="gidAllocate",value="true"}]

}

module "cp4a-file-retain-bronze-gid" {
  source = "github.com/cloud-native-toolkit/terraform-gitops-ocp-storageclass"

  gitops_config = module.gitops.gitops_config
  git_credentials = module.gitops.git_credentials
  server_name = module.gitops.server_name
  
  name="cp4a-file-retain-bronze-gid"
  provisioner_name="ibm.io/ibmc-file"
  vol_binding_mode="Immediate"
  reclaim_policy="Retain"
  parameter_list=[{key="type", value="Endurance"},{key = "iopsPerGB",value = "2"},{key = "sizeRange", value = "[20-12000]GiGi"},{key="billingType",value="hourly"},{key="classVersion",value="2"},{key="gidAllocate",value="true"}]

}
