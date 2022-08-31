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

variable "map-var" {
    type = map(string)
 }