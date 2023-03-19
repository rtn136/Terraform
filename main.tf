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

