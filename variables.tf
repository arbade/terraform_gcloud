variable "region" {
  default = "us-west1-a" # Oregon
}

variable "project-name" {
  default = "double-skyline-310919"
}

variable "subnetwork-region" {
  default = "us-west1"
}

variable "network" {
  default = "ovirt-network"
}

variable "vm_type" {
  default  = "n1-standard-2" #Special CPU
  
}

variable "os" {
  default  = "centos-cloud/centos-7" #latest centos7
  
}