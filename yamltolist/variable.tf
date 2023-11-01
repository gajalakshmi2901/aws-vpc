

variable "list_config_paths" {
  type        = list(string)
  description = "Paths to YAML configuration files of list type"
  default     = ["https://raw.githubusercontent.com/cloudposse/terraform-aws-service-control-policies/master/catalog/organization-policies.yaml"
]
}
