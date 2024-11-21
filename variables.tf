variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "emander-vpn-instance"
}

variable "public_key" {
  description = "Value of your public key"
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDhHTVSqc9M6zBHlGiTPnTpPxUcL+hFoaJLqiKTR+j5V0f7WSseDi0WPjHMLU0LYMO+drN7iqQFWW6UNu59NdzA+v+AGl2E0a1lGJHQ08TFqZSGwIdK3WfvAqUz3gZeNPwgOC3NNzZ2SxJSXnAVt3Ne7p/yXoXZVzSICQzngZJ5tuHGrPdVyiqRWOswqsMqHVmQUq0feUrGoYUgAkNY7nK1mXaUxAnoc6QiGrofQAzMgsB5MENog56sQe+YfmuI475BQXIc7ZjopIDedtJXliybFU2l70ekVVNQ3Hy0eWEQaThmofjz+Jn1GLJrXFBCJJ829ogv8s9MIbAR0qYHesOX emanderdangla@Emanders-Laptop.local"
}
