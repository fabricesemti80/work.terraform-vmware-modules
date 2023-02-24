variable "ps_file_path" {
  type        = string
  description = "File path to an optional PS1 file that should be run"
  default     = "src/bootstrap.ps1"
}
variable "yaml_file_path" {
  type        = string
  description = "File path to an optional metadata file"
  default     = "src/metadata.yaml"
}
variable "template_vars" {
  type        = map(string)
  description = "Demonstration of parameters for the running script"
  default = {
    filename = "the_provisioner_was_here"
  }
}
variable "run_once" {
  description = "List of Comamnd to run during first logon"
  type        = list(string)
  default = [
    "powershell \"cd \"$env:ProgramFiles\\VMware\\VMware~1\";[System.Text.Encoding]::ASCII.GetString([System.Convert]::FromBase64String($(.\\rpctool.exe \\\"info-get guestinfo.userdata\\\")))|out-file C:\\bootstrap.ps1\"",
    "cmd.exe /C Powershell.exe -ExecutionPolicy Bypass -File C:\\bootstrap.ps1"
  ]
}
