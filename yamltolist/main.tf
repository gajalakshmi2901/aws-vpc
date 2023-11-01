module "yamlToList"{
source= "github.com/gajalakshmi2901/yaml-list.git"
list_config_paths = var.list_config_paths
}
data "aws_caller_identity" "this" {}

module "scp"{
    source="github.com/gajalakshmi2901/scp-module.git"
    service_control_policy_statements=module.yamlToList.list_config_paths
    service_control_policy_description=var.service_control_policy_description
    target_id=var.target_id
    depends_on=[module.yamlToList]
}