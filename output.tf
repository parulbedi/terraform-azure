# output "pem-file" {
#   value = tls_private_key.ssh_keys.public_key_openssh
# }

output "output-str" {
    value = var.string-var
}

output "output-num-1" {
    value = var.number-1-var
}

output "output-num-2" {
    value = var.number-2-var
}

output "output-bool-var" {
    value = var.bool-var
}

output "output-list-var" {
    value = var.list-var
}

output "output-set-var" {
    value = var.set-var
}

output "output-map-pri-var" {
    value = var.map-pri-var
}

output "output-map-obj-var" {
    value = var.map-obj-var
}

output "output-map-obj2-var" {
    value = var.map-obj2-var
}

output "output-local-1-var" {
    value = local.myname
}


output "output-string-palin-var" {
  value = var.string-palin-var
}


output "output-list-add-var" {
    value = var.list-add-var[0] + var.list-add-var[1]
}

output "output-list-signum-var" {
    value = [for nmbrs in var.list-signum-var : signum(nmbrs)]
    # value = local.local-signum 
  }

output "output-map-mydetails-var" {
    value = var.map-mydetails-var
}

output "output-list-upper-var" {
    value = [for names in var.list-upper-var : upper(names)]
}

# output "output-set-obj-cidr-rgn-var" {
#     value = var.set-obj-cidr-rgn-var
# }

output "output-set-name-var" {
    value = var.set-name-var
}
