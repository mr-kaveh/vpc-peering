terraform {
  source = "../../terraform/frankfurt"
}

include {
  path = find_in_parent_folders()
}
