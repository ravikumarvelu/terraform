resource "aws_instance" "web" {
  ami                         = var.instance_ami
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.public[0].id
  vpc_security_group_ids      = [aws_security_group.web.id]
  associate_public_ip_address = true
  iam_instance_profile        = aws_iam_instance_profile.ec2.name

  user_data = base64encode(templatefile("${path.module}/templates/web-user-data.sh", {
    bucket_name = aws_s3_bucket.app.bucket
  }))

  tags = {
    Name = "${var.project_name}-web"
  }
}