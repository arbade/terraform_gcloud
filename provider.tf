provider "google" {
  credentials = "${file("/.<YOUR_CREDENTIAL.json>")}"
  project     = "${var.project-name}"
  region      = "${var.region}"
}
