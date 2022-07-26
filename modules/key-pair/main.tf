################################################################################
# Key Pair
################################################################################

resource "aws_key_pair" "this" {
  # count = var.create ? 1 : 0
  count = var.create ? length(var.key_name) : 0

  key_name        = var.key_name[count.index]
  key_name_prefix = var.key_name_prefix
  # public_key      = var.create_private_key ? trimspace(tls_private_key.this[0].public_key_openssh) : var.public_key
  # public_key      = var.create_private_key ? trimspace(tls_private_key.this[count.index].public_key_openssh) : var.public_key
  public_key        = var.create_private_key ? file(var.key_path[count.index]) : var.public_key

  tags = var.tags
}

################################################################################
# Private Key
################################################################################

resource "tls_private_key" "this" {
  # count = var.create && var.create_private_key ? 1 : 0
  count = var.create && var.create_private_key ? length(var.key_name) : 0

  algorithm = var.private_key_algorithm
  rsa_bits  = var.private_key_rsa_bits
}