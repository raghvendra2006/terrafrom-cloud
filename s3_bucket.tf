resource "aws_s3_bucket" "raghvendra127345" {
  bucket = "raghvendra127345"  # Specify your desired bucket name
  #acl    = "private"  # Set the access control list for the bucket (private, public-read, public-read-write, aws-exec-read, authenticated-read)

  tags = {
    Environment = "test"
  }
}
