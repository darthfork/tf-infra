resource "aws_cloudtrail" "management" {
  name                          = "tf-trail-management"
  s3_bucket_name                = aws_s3_bucket.tf-management-trail.id
  s3_key_prefix                 = "prefix"
  include_global_service_events = false
}
