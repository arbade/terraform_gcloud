variable "region" {
  default = "us-west1-a" # Oregon
}

variable "region_2" {
  default = "us-central1-a" # Oregon
}

variable "project-name" {
  default = "double-skyline-310919"
}

variable "subnetwork-region" {
  default = "us-west1"
}

variable "subnetwork-region-2" {
  default = "us-west2"
}

variable "network" {
  default = "ovirt-network"
}

variable "network_2" {
  default = "ovirt-network"
}

variable "vm_type" {
  default  = "n1-standard-2" #Special CPU
  
}

variable "vm_type_2" {
  default  = "e2-standard-2" #Special CPU
  
}

variable "os" {
  default  = "centos-cloud/centos-7" #latest centos7
  
}