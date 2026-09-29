output "vpc_id" {
  description = "ID of the created VPC."
  value       = aws_vpc.main.id
}

output "public_subnet_ids" {
  description = "Public subnet IDs."
  value       = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  description = "Private subnet IDs."
  value       = aws_subnet.private[*].id
}

output "web_instance_id" {
  description = "ID of the EC2 web instance."
  value       = aws_instance.web.id
}

output "web_instance_public_ip" {
  description = "Public IP address of the EC2 web instance."
  value       = aws_instance.web.public_ip
}

output "s3_bucket_name" {
  description = "Name of the deployed S3 bucket."
  value       = aws_s3_bucket.app.bucket
}
