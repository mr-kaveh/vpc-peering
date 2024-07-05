terraform {
  source = "../../terraform/paris"
}

include {
  path = find_in_parent_folders()
}
