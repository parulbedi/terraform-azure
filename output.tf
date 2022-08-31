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

output "output-list-var"{
    value = var.list-var
}

output "output-set-var"{
    value = var.set-var
}

output "output-map-pri-var"{
    value = var.map-pri-var
}

output "output-map-obj-var"{
    value = var.map-obj-var
}

output "output-map-obj2-var"{
    value = var.map-obj2-var
}

output "local-var"{
    value = local.myname
}