module "network" {
  source  = "app.terraform.io/Golfzon/add-11-module_network/AWS"
  version = "1.0.0"
  vpc_cidr = var.vpc_cidr
  pub_a_cidr = var.pub_a_cidr
  pub_c_cidr = var.pub_c_cidr
  pri_a_cidr = var.pri_a_cidr
  pri_c_cidr = var.pri_c_cidr
  dbpri_a_cidr = var.dbpri_a_cidr
  dbpri_c_cidr = var.dbpri_c_cidr
  prefix      = var.prefix
}

module "sg" {
  source  = "app.terraform.io/Golfzon/add-11-module_sg/AWS"
  version = "1.0.0"
  vpc_id = module.network.vpc_id
  
  sg_in_cidr = var.sg_in_cidr
  prefix = var.prefix
}

module rds {
  source  = "app.terraform.io/Golfzon/add-11-module_rds/AWS"
  version = "1.0.0"
  dbpri_subnet_a_id = module.network.dbpri_subnet_a_id
  dbpri_subnet_c_id = module.network.dbpri_subnet_c_id
  sg_id   = module.sg.sg_id
  
  db_ins_cls = var.db_ins_cls
  rds_dbname = var.rds_dbname
  rds_username = var.rds_username
  rds_password = var.rds_password
  prefix = var.prefix
}

module web {
  source  = "app.terraform.io/Golfzon/add-11-module_web/AWS"
  version = "1.0.0"
  pub_subnet_a_id = module.network.pub_subnet_a_id
  pub_subnet_c_id = module.network.pub_subnet_c_id
  sg_id   = module.sg.sg_id
  
  ec2_key = var.ec2_key
  web_ec2_type = var.web_ec2_type
  prefix = var.prefix
}

module was {
  source = "app.terraform.io/Golfzon/add-11-module_was/AWS"
  version = "1.0.0"
  pri_subnet_a_id = module.network.pri_subnet_a_id
  pri_subnet_c_id = module.network.pri_subnet_c_id
  sg_id   = module.sg.sg_id
  
  ec2_key = var.ec2_key
  was_ec2_type = var.was_ec2_type
  prefix = var.prefix
}