variable "my_array" {
  type    = list(string)
  default = ["404", "401", "500"]
}

locals {
	compose_filter = [for item in var.my_array    : format("%s%s%s", "($.message = \"*'code': ", item, "*\")")]
	compose_logic = join(" && ", local.compose_filter)
	append_reponse = format("%s%s%s", "{($.message = \"response:*\") && ", local.compose_logic, "}")
}

output "compose_filter" {
  value = local.compose_filter
}

output "compose_logic" {
  value = local.compose_logic
}

output "append_reponse" {
  value = local.append_reponse
}
