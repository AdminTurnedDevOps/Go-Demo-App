variable "resource_group" {
  type = string
}

variable "mysql_server_name" {
  type = string
}

variable "location" {
  type = string
}

variable "mysql_password" {
  type = string
  sensitive = true
}

variable "db_name" {
  type = string
}