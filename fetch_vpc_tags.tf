# Fetch details of the specified VPC
data "aws_vpc" "my_vpc" {
  id = "vpc-009ac89e0d5b2c1f8"  # Replace with your actual VPC ID
}

# Output the VPC tags
output "vpc_tags" {
  value = data.aws_vpc.my_vpc.tags
}