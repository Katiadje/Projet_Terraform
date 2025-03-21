# main.tf

resource "aws_instance" "my_instance" {
  ami           = var.ami_id       # Utilise l'AMI définie dans variables.tf
  instance_type = var.instance_type
  key_name      = var.key_name

  security_groups = ["ssh-access"]

  associate_public_ip_address = true

  tags = {
    Name = "MyFlaskInstance"
  }
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-unique-bucket-name"
  acl    = "private"
}

resource "aws_db_instance" "my_db" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "postgres"
  engine_version       = "13.3"
  instance_class       = "db.t3.micro"
  name                 = "mydb"
  username             = "admin"
  password             = "password123"
  skip_final_snapshot  = true
  publicly_accessible = true
}
