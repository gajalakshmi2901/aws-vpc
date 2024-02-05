create_aurora                   = true
name                            = "aurora-db-postgres-qa"
engine                          = "aurora-postgresql"
engine_version                  = "14.5"
instance_class                  = "db.r6g.2xlarge"
create_db_subnet_group          = true
subnets                         = ["subnet-0975cf1f91f31a5e7", "subnet-0b13450d9b9aa8b61"]
db_subnet_group_name            = "qa-rds-db-subnet-group"
storage_encrypted               = true
apply_immediately               = true
monitoring_interval             = 10
enabled_cloudwatch_logs_exports = ["postgresql"]
master_username                 = "master"
availability_zones              = ["ap-south-1a"]
allocated_storage               = 100
db_parameter_group_family       = ""
region                          = "ap-south-1"
instances = {
  "aurora-cluster-1a" = {
    instance_class = "db.r6g.2xlarge"
  }
}
tags                          = { Environment = "QA" }
# master_user_secret_kms_key_id = "arn:aws:kms:ap-south-1:255301463676:key/7cb64bde-faf8-4288-8b5a-a75273f73c60"
