output "b64_metadata" {
    value = base64encode(data.template_file.init.rendered)
}
output "b64_init" {
    value = base64encode(data.template_file.metadata.rendered)
}