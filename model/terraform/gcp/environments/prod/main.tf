provider "google" {
  project = var.project
  region  = var.region
  zone    = var.zone
}

module "network" {
  source       = "../../modules/network"
  network_name = var.network_name
  subnet_name  = var.subnet_name
  subnet_ip    = var.subnet_ip
  region       = var.region
}

module "firewall" {
  source     = "../../modules/firewall"
  network_id = module.network.network_id
}

module "vm" {
  source    = "../../modules/vm"
  subnet_id = module.network.subnet_id
  zone      = var.zone
}

module "sql" {
  source            = "../../modules/sql"
  sql_instance_name = var.sql_instance_name
  region            = var.region
  db_user           = var.db_user
  db_password       = var.db_password
  db_name           = var.db_name
}

module "secret" {
  source       = "../../modules/secret"
  secret_id    = var.secret_id
  secret_value = var.db_password
}

module "vm" {
  source    = "../../modules/vm"
  subnet_id = module.network.subnet_id
  zone      = var.zone
}

