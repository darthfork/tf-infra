resource "aws_cloudtrail" "management" {
  count                         = 1
  name                          = "tf-trail-management"
  s3_bucket_name                = aws_s3_bucket.tf-management-trail.id
  s3_key_prefix                 = "management"
  include_global_service_events = false
}
