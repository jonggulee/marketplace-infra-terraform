variable "name" {
  description = "모듈에서 정의하는 모든 리소스 이름의 prefix"
  type        = string
}

variable "cidr" {
  description = "VPC에 할당한 CIDR block"
  type        = string
}

variable "public_subnets" {
  description = "Public Subnet IP 리스트"
  type        = list(any)
}

variable "private_subnets" {
  description = "Private Subnet IP 리스트"
  type        = list(any)
}

variable "restricted_subnets" {
  description = "Restricted Subnet IP 리스트"
  default     = []
  type        = list(any)
}

variable "azs" {
  description = "사용할 availability zones 리스트"
  type        = list(any)
}

variable "tags" {
  description = "모든 리소스에 추가되는 tag 맵"
  type        = map(any)
}