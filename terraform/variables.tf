variable "ec2-instances" {
  type = map(object({
    ami           = string
    instance_type = string
    key_name      = string
    replicas      = number
    sgs = map(object({
      port    = number
      sources = list(string)
    }))
    tags = map(string)
  }))
}
