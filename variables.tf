variable "acgs" {
  description = "ACG 정보 리스트"
  type = list(object({
    name        = string # ACG 이름
    vpc_id      = string # VPC ID
    description = string # ACG 메모
  }))
}

variable "inbound_rules" {
  description = "ACG 인바운드 규칙 맵 (key: ACG 이름)"
  type = map(list(object({
    protocol    = string # 프로토콜 (TCP | UDP | ICMP)
    ip_block    = string # 접근소스 (CIDR)
    port_range  = string # 허용 포트 (1-65535)
    description = string # 메모
  })))
}

variable "outbound_rules" {
  description = "ACG 아웃바운드 규칙 맵 (key: ACG 이름)"
  type = map(list(object({
    protocol    = string # 프로토콜 (TCP | UDP | ICMP)
    ip_block    = string # 접근소스 (CIDR)
    port_range  = string # 허용 포트 (1-65535)
    description = string # 메모
  })))
}
