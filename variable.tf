variable "user_uuid" {
 type = string
}

variable "bucket_name" {
 type = string
}

variable "access_key" {
  description = "The AWS access key"
}

variable "secret_key" {
  description = "The AWS secret key"
}

variable "token" {
  description = "The AWS session token"
}