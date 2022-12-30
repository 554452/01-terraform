provider "aws" {
	region = "ap-northeast-2"
}

variable "user_names" {
	description = "Create IAM users with these names"
	type = list(string)
	default = ["std00-neo", "std00-trinity", "std00-morpheus" ]
}

resource "aws_iam_user" "example" {
  for_each = toset(var.user_names)
	name  = each.value
}

output "all_user" {
  value = values(aws_iam_user.example)[*].name
}

