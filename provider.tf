terraform {
  required_version = "~> 1.0"
  required_providers {
    newrelic = {
        source = "newrelic/newrelic"
    }
  }
}

provider "newrelic" {
  account_id = var.nr_account_id
  api_key = var.nr_api_key
  region = var.region-newrelic
}


