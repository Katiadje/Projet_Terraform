# main.tf

# Création de la machine virtuelle (VM)
resource "aws_instance" "web_server" {
  ami = "ami-xxxxxxxxxxxxxxxxx"  # Remplacez par un ID d'AMI Ubuntu ou autre OS
  instance_type = "t2.micro"  # Choix de l'instance (peut être modifié en fonction des besoins)
  key_name = var.key_name  # Utiliser la clé SSH pour accéder à la VM
  associate_public_ip_address = true

  tags = {
    Name = "flask-vm"
  }

  # Provisionner Python et Flask via un script
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update -y",
      "sudo apt-get install python3-pip -y",
      "pip3 install flask"
    ]
  }
}

# Création du stockage S3
resource "aws_s3_bucket" "static_files" {
  bucket = var.s3_bucket_name
  acl    = "private"  # Par défaut, le bucket est privé

  versioning {
    enabled = true
  }
}

# Optionnel : Création d'une base de données RDS
resource "aws_db_instance" "database" {
  allocated_storage = 20
  storage_type      = "gp2"
  engine            = "postgres"
  instance_class    = "db.t2.micro"
  name              = "mydatabase"
  username          = "admin"
  password          = "adminpassword"
  skip_final_snapshot = true
}
