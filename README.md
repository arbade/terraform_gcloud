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

### Usage

You can use the remote backend as gcs or any other backends as described in the docs of terraform. If using gcs as is the case here. Do a

``$ gcloud auth application-default login``
before running

``$ terraform init``
This will create the terraform.tfstate

```
arbade@Ardas-MacBook-Pro gcp % terraform init 

Initializing the backend...

Initializing provider plugins...
- Reusing previous version of hashicorp/google from the dependency lock file
- Using previously-installed hashicorp/google v3.64.0


Warning: Interpolation-only expressions are deprecated

  on firewall.tf line 3, in resource "google_compute_firewall" "ssh":
   3:   network = "${google_compute_network.ovirt_network.name}"

Terraform 0.11 and earlier required all non-constant expressions to be
provided via interpolation syntax, but this pattern is now deprecated. To
silence this warning, remove the "${ sequence from the start and the }"
sequence from the end of this expression, leaving just the inner expression.

Template interpolation syntax is still used to construct strings from
expressions when the template includes multiple interpolation sequences or a
mixture of literal strings and interpolations. This deprecation applies only
to templates that consist entirely of a single interpolation sequence.

(and 28 more similar warnings elsewhere)

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.

```
After the Initialization, it could be following the next parameters to terraform
```
$ terraform plan
$ terraform apply
```

Finally, you would be able to see successfully creating your own cluster on Google Cloud 
```
google_compute_subnetwork.ovirt_network_subnetwork: Destroying... [id=projects/double-skyline-310919/regions/europe-west3/subnetworks/ovirt-network-subnetwork-europe-west3]
google_compute_subnetwork.ovirt_network_subnetwork: Still destroying... [id=projects/double-skyline-310919/regions/.../ovirt-network-subnetwork-europe-west3, 10s elapsed]
google_compute_subnetwork.ovirt_network_subnetwork: Destruction complete after 13s
google_compute_subnetwork.ovirt_network_subnetwork: Creating...
google_compute_subnetwork.ovirt_network_subnetwork: Still creating... [10s elapsed]
google_compute_subnetwork.ovirt_network_subnetwork: Creation complete after 14s [id=projects/double-skyline-310919/regions/us-west1/subnetworks/ovirt-network-subnetwork-us-west1]
google_compute_instance.jenkins-instance: Creating...
google_compute_instance.sonar-store-instance: Creating...
google_compute_instance.artifactory-engine-instance: Creating...
google_compute_instance.node-engine-instance: Creating...
google_compute_instance.sonar-store-instance: Still creating... [10s elapsed]
google_compute_instance.jenkins-instance: Still creating... [10s elapsed]
google_compute_instance.node-engine-instance: Still creating... [10s elapsed]
google_compute_instance.artifactory-engine-instance: Still creating... [10s elapsed]
google_compute_instance.sonar-store-instance: Creation complete after 17s [id=projects/double-skyline-310919/zones/us-west1-a/instances/sonar-store]
google_compute_instance.artifactory-engine-instance: Creation complete after 17s [id=projects/double-skyline-310919/zones/us-west1-a/instances/artifactory-engine]
google_compute_instance.node-engine-instance: Creation complete after 17s [id=projects/double-skyline-310919/zones/us-west1-a/instances/node-engine]
google_compute_instance.jenkins-instance: Creation complete after 17s [id=projects/double-skyline-310919/zones/us-west1-a/instances/jenkins-engine]

Apply complete! Resources: 5 added, 0 changed, 1 destroyed.

```


 
