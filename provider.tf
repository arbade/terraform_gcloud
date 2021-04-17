provider "google" {
  credentials = "${file("/Users/arbade/Desktop/gcp/double-skyline-310919-fe048b95a3c6.json")}"
  project     = "${var.project-name}"
  region      = "${var.region}"
}
