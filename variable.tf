variable "string-var" {
    type = string
}

variable "number-1-var" {
    type = number
}

variable "number-2-var" {
    type = number
}

variable "bool-var"{
    type = bool
}

variable "list-var" {
    type = list(string)
 }

variable "set-var" {
    type = set(string)
 }

variable "map-pri-var" {
    type = map(any)
 }

variable "map-obj-var" {
     type = object ({
        cidr_block = string
        region = string
     })
 }

variable "map-obj2-var" {
     type = map(object ({
        cidr_block = string
        region = string
     }))
 }

 variable "list-add-var"{
    type = list(number)
 }

variable "map-mydetails-var" {
     type = map(object ({
        name = string
        age  = number
     }))
 }

 variable "list-upper-var" {
     type = list(string)
 }