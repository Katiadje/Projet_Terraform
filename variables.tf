# variables.tf

variable "instance_type" {
  description = "Type de l'instance (par exemple, t2.micro)"
  default     = "t2.micro"
}

variable "region" {
  description = "Région du provider (par exemple, us-west-2 pour AWS)"
  default     = "us-west-2"
}

variable "ami_id" {
  description = "ID de l'AMI à utiliser pour l'instance"
}

variable "key_name" {
  description = "Nom de la clé SSH"
}
