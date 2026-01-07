variable "resource_group_name" {
  type = map(object({
    name     = string
    location = string
  }))
}
