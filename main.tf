provider "aws" {
    region = var.root_region
}

module "create_s3_backend" {
  source = "./modules/create_s3_backend"
  bucket_name = var.root_s3_backend_bucket_name
}

module "create_ddb_backend" {
  source = "./modules/create_ddb_backend"
  table_name = var.root_ddb_backend_table_name
  field_name = var.root_ddb_backend_field_name
}

module "create_key_pair" {
  source = "./modules/create_key_pair"
  key_pair_key_name = var.root_key_pair_key_name
}

module "create_security_group" {
  source = "./modules/create_security_group"
  jenkins_security_group_name = var.root_jenkins_security_group_name
}

module "create_ec2_instance" {
  source = "./modules/create_ec2_instance"
  ec2_ami_id = var.root_ami_id
  ec2_instance_type = var.root_instance_type
  ec2_key_name = module.create_key_pair.pem_key_pair_id
  ec2_security_group = module.create_security_group.security_group_id
}

module "install_jenkins_remote_exec" {
  source = "./modules/provisioner"
  host = module.create_ec2_instance.ec2_public_ip_address
  user = var.root_user
  ec2_pem = var.root_key_path
  src = var.root_src
  dest = var.root_dest
}

