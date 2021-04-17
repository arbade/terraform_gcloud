# Multi-Instance on Google Cloud by Terraform
### Overall

It could be configured the Google Cloud Service & Instance to Infrastructure as a Code (IaC) by Terraform
In this section, you would be able to see 4 VM Instance on Google Cloud with it's own configurations such as:

- Resources
- VPC
- Firewall Rules
- Declared Global Variables

### Pre-Requirements

First of all, it should be install terraform cli on your local to configuration your own VM Instance

``brew install terraform``

Second point of view, it should be configure GCloud Auth from your cli to apply all configs on IaC
 ``gcloud init `` then, it could be entry the your google cloud credential from terminal (MacOS)
 
Third way to configuration is defined the <credential.json> into as a path variable ```provider.tf``` such as:
```
provider "google" {
  credentials = "${file("/.<YOUR_CREDENTIAL.json>")}" # could be configuration from Google Cloud UI
  project     = "${var.project-name}" # global variable from variable.tf
  region      = "${var.region}" # global variable from variable.tf
}
```
Fourth Step of configuration is that, to be configurate ``variable.tf`` for using global variable to all .tf file, then could be configured to firewall policy for VM Instance
``firewall.tf`` in addition to configure the network policy to VM Instance from ``network.tf`` for which all needed to accessing our infrastructure service

Final Step, it could be configured the VM Instances and calling the global variables in this section on ``main.tf``

 
