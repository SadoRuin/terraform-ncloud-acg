variable "acgs" {
  description = "ACG 정보 리스트"
  type = list(object({
    name        = string # ACG 이름
    vpc_id      = string # VPC ID
    description = string # ACG 메모
    inbound_rules = optional(list(object({
      protocol    = string # 프로토콜 (TCP | UDP | ICMP)
      ip_block    = string # 접근소스 (CIDR)
      port_range  = string # 허용 포트 (1-65535)
      description = string # 메모
    })), [])
    outbound_rules = optional(list(object({
      protocol    = string # 프로토콜 (TCP | UDP | ICMP)
      ip_block    = string # 접근소스 (CIDR)
      port_range  = string # 허용 포트 (1-65535)
      description = string # 메모
    })), [])
  }))
}
