#!/bin/bash

dnf update -y

dnf install -y httpd

systemctl enable httpd
systemctl start httpd

cat <<EOF > /var/www/html/index.html
<html>
  <body>
    <h1>Terraform AWS Demo</h1>
    <p>Bucket name: ${bucket_name}</p>
  </body>
</html>
EOF
