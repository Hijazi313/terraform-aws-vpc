variable "vpc_config" {
  description = "To get the cidr and name of the vpc from the user"
  type = object({
    cidr_block = string
    name       = string
  })
  validation {
    condition     = can(cidrnetmask(var.vpc_config.cidr_block))
    error_message = "Invalid CIDR Format ${var.vpc_config.cidr_block}"
  }
}


variable "subnet_config" {
  description = "Ge the CIDR and AZ  fro the subnets"
  type = map(object({
    cidr_block = string
    az         = string
    public     = optional(bool, false)
  }))

  validation {
    condition     = alltrue([for config in var.subnet_config : can(cidrnetmask(config.cidr_block))])
    error_message = "Invalid CIDR Format "
  }
}
