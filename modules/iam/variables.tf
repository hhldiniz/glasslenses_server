variable "pipeline_user_username" {
    description = "The username of the pipeline user"
    type        = string
    default = null
}

variable "pipeline_user_display_name" {
    description = "The display name of the pipeline user"
    type        = string
    default = "Pipeline User"
}

variable "pipeline_user_family_name" {
    description = "The family name of the pipeline user"
    type        = string
    default = "Pipeline"
}

variable "pipeline_user_given_name" {
    description = "The given name of the pipeline user"
    type        = string
    default = "User"
}