data "template_file" "init" {
  template = file("${path.module}/${var.ps_file_path}")
  vars = var.template_vars
}
#Not used but could be another location to store data
data "template_file" "metadata" {
  template = file("${path.module}/${var.yaml_file_path}")
  vars = {
  }
}