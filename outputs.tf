# outputs.tf

output "instance_ip" {
  description = "L'adresse IP publique de l'instance"
  value       = aws_instance.my_instance.public_ip
}

output "bucket_name" {
  description = "Le nom du bucket S3"
  value       = aws_s3_bucket.my_bucket.bucket
}

output "db_endpoint" {
  description = "L'endpoint de la base de données"
  value       = aws_db_instance.my_db.endpoint
}
