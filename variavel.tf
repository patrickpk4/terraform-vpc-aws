variable "cidr-vpc" {
  type        = string
  default     = "10.0.0.0/16"
  description = "range de ip da vpc"

}

variable "nome" {
  type        = string
  default     = "proj-vpc-simp"
  description = "nome do projeto"

}

variable "cidr-privada" {
  type        = string
  default     = "10.0.1.0/24"
  description = "range de ip subnet privada"

}

variable "cidr-publica" {
  type        = string
  default     = "10.0.2.0/24"
  description = "range de ip subnet privada"

}

variable "cidr-publica2" {
  type        = string
  default     = "10.0.3.0/24"
  description = "range de ip subnet publica2"

}

variable "cidr-db" {
  type        = string
  default     = "10.0.4.0/24"
  description = "range de ip subnet db"

}

variable "cidr-db2" {
  type        = string
  default     = "10.0.5.0/24"
  description = "range de ip subnet db"

}

variable "regiao" {
  type        = string
  default     = "us-east-1"
  description = "regiao "
}

variable "db-username" {
  type        = string
  default     = "kubenews"
  description = "nome do usuario do db rds "

}

variable "db-name" {
  type        = string
  default     = "kubenews"
  description = "nome do banco de dados  "
}

variable "db-password" {
  type        = string
  sensitive   = true
  description = "senha do banco — use: export TF_VAR_db-password=suasenha"
}
