variable "public_ips" {
  type = map(object({
    public_ips_name     = string
    resource_group_name = string
    location            = string
    allocation_method   = string
  }))
}
