# output "pem-file" {
#   value = tls_private_key.ssh_keys.public_key_openssh
# }

output "output-str"{
    value = var.string-var
}

output "output-num-1"{
    value = var.number-1-var
}

output "output-num-2"{
    value = var.number-2-var
}

output "output-bool-var"{
    value = var.bool-var
}