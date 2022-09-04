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


 variable "string-palin-var" {
  type = string
  validation {
    condition     = strrev(var.string-palin-var) == var.string-palin-var
    error_message = "Not a palindome."
  }
}

 variable "list-add-var"{
    type = list(number)
 }

 variable "list-signum-var" {
  type = list(number)
}


variable "map-mydetails-var" {
     type = map(object ({
        name = string
        age  = number  
     }))

     validation {
        condition = var.map-mydetails-var.mydetails.age >18
        error_message = "Age is less than 18 years!!"
        }
 }

 variable "list-upper-var" {
     type = list(string)
 }

# variable "set-obj-cidr-rgn-var" {
#   type = set(object ({
#     cidr_block = string  
#     region = string 
#   }))
# }

variable "set-name-var" {
    type = set(any)
}
