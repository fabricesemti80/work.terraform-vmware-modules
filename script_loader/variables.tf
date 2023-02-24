variable "ps_file_path" {
  type        = string
  description = "(optional) describe your variable"
  default     = "src/bootstrap.ps1"
}
variable "yaml_file_path" {
  type        = string
  description = "(optional) describe your variable"
  default     = "src/metadata.yaml"
}
variable "template_vars" {
  type = map(string)
  default = {
    filename = "the_provisioner_was_here"
  }
}
