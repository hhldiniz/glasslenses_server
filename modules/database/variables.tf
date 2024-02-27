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
    type        = map(string)
}