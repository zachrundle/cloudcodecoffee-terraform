terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "cloudcodecoffee"

    # TODO: look into using prefix instead
    workspaces {
      name = "ccc"
    }
  }
}