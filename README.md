# TERRAFORM-ON-AZURE
Practising how to automate cloud infrastructure using Terraform.
Files included are all trying to achieve a different thing.
- Configuring a resource group
- Configuring a virtual network
- Configuring a subnet
- Configuring storage account and a container
- configuring a virtual machine

The terraform commands used on the terminal are 

  Terraform init – used for initialization of a working directory.
  Terraform init – used for initialization of a working directory.
  Terraform validate – used to validate configuration files in a directory.
  it can catch multiple error types; keyword usage& spelling, duplicate module & resource configurations, missing variables, etc.

  Terraform plan– previews the changes to be made.
  Terraform apply – executes the configuration to create or update 
  Out – used for the file path for the newly generated execution plan 
  Terraform destroy- destroys previously created infrastructure.

once the terraform script is run, changes are effected on the azure portal . it's possible to see the infrastructure from the portal as if i created it from there.

Trying to achieve secure IAC practices:
- i stored my .tfstate fils on an azure storage account instead of locally storing them.
- authenticated to azure beore starting to execute the subsequent command by using
 az login
 az set subscription 'xxxxxxx-xxxx-xxxxx-xxxxxxxxxxxx'
 - avaoided had coding sensitive data and used variables to call what i need in the main.tf. 
