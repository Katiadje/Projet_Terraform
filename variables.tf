# variables.tf

variable "region" {
  description = "La région AWS où déployer l'infrastructure"
  type        = string
  default     = "us-west-1"
}

variable "aws_access_key" {
  description = "Clé d'accès AWS"
  type        = string
}

variable "aws_secret_key" {
  description = "Clé secrète AWS"
  type        = string
}

variable "key_name" {
  description = "Nom de la clé SSH pour accéder à la VM"
  type        = string
}

variable "s3_bucket_name" {
  description = "Nom du bucket S3 pour stocker les fichiers statiques"
  type        = string
}
