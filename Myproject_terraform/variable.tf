variable "nic_name" {
    type = map(string)
    default = {
      vm1 = "example_nic1"
      vm2 = "example_nic2"
    
    }
  
}

variable "vm_names" {
  type = map(string)
  default = {
    vm1 = "example-mch1"
    vm2 = "example-mch2"
    
  }
}
