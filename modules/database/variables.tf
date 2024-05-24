variable "database_name" {
    description = "The name of the database"
    type        = string
    default     = "mydb"
}

variable "primary_key" {
    description = "The primary key of the database"
    type        = map(string)
}

variable "columns" {
    description = "The columns of the database"
    type        = list(map(string))
    default = []
}

variable "ttl_field_name" {
    description = "Name of the field used to set the TTL for each row"
    type = string
}

variable "enable_ttl" {
    description = "Whether you want do you TTL or not for each row"
    type = bool
}