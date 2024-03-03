variable "REGION" {
  default = "us-west-2"
}

variable "ZONE1" {
  default = "us-west-2a"
}

variable "AMI" {
  type = map(any)
  default = {
    us-west-2 = "ami-008fe2fc65df48dac"
  }

}

variable "INSTANCE_TYPE" {
  type = map(any)
  default = {
    us-west-2 = "t2.micro"
  }
}

variable "KEY_PAIR" {
  default = "rough-one"
}

variable "SECURITY" {
  default = "sg-05336b8b1eea2674d"
}

variable "USER" {
  default = "ubuntu"
}
