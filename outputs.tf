# outputs.tf

output "vm_public_ip" {
  description = "Adresse IP publique de la machine virtuelle"
  value       = aws_instance.web_server.public_ip
}

output "s3_bucket_url" {
  description = "URL du bucket S3"
  value       = aws_s3_bucket.static_files.website_endpoint
}
