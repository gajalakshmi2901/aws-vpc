

module "cluster" {
  source                          = "./aws-rds-aurorapostgre"
  create_aurora                   = var.create_aurora
  name                            = var.name
  engine                          = var.engine
  engine_version                  = var.engine_version
  instances                       = var.instances
  create_db_subnet_group          = var.create_db_subnet_group
  subnets                         = var.subnets
  db_subnet_group_name            = var.db_subnet_group_name
  master_username                 = var.master_username
  storage_encrypted               = var.storage_encrypted
  apply_immediately               = var.apply_immediately
  monitoring_interval             = var.monitoring_interval
  master_user_secret_kms_key_id   = var.master_user_secret_kms_key_id
  enabled_cloudwatch_logs_exports = var.enabled_cloudwatch_logs_exports
  storage_type                    = var.storage_type
  availability_zones              = var.availability_zones
  region                          = var.region
  tags                            = var.tags
}
