# Створюємо S3 bucket для статичного хостингу React
resource "aws_s3_bucket" "react_bucket" {
  bucket = "react-frontend-bucket"

  tags = {
    Name = "ReactFrontendBucket"
  }
}

# Політика для публічного доступу
resource "aws_s3_bucket_policy" "react_bucket_policy" {
  bucket = aws_s3_bucket.react_bucket.bucket

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = "*"
        Action = "s3:GetObject"
        Resource = "${aws_s3_bucket.react_bucket.arn}/*"
      }
    ]
  })
}
