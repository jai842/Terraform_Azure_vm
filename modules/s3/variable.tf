variable location {
  type = string
  
}

variable resource_group_name {
    type = string
    
}

variable storage_account_name {
    type = string
    
}

# variable storage_accounts {
#   default = [
#     {
#       name = "niston"
#       account_tier = "Standard"
#       account_replication_type = "LRS"
#     },
#     {
#       name = "dvedss"
#       account_tier = "Standard"
#       account_replication_type = "ZRS"
#     }
#   ]
# }