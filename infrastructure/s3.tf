# Створюємо S3 bucket для статичного хостингу React
resource "aws_s3_bucket" "react_bucket" {
  bucket = "my-react-frontend-bucket"

  tags = {
    Name = "ReactFrontendBucket"
  }
}

resource "aws_s3_bucket_policy" "react_bucket_policy" {
  bucket = aws_s3_bucket.react_bucket.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = "*",
        Action = "s3:GetObject",
        Resource = "${aws_s3_bucket.react_bucket.arn}/*"
      }
    ]
  })
}

# Resource to avoid error "AccessControlListNotSupported: The bucket does not allow ACLs"
resource "aws_s3_bucket_ownership_controls" "s3_bucket_acl_ownership" {
  bucket = aws_s3_bucket.react_bucket.id
  rule {
    object_ownership = "ObjectWriter"
  }
}

