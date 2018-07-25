# Configure the OpenStack Provider
provider "opentelekomcloud" {
  user_name   = "c2c-5"
  domain_name = "OTC00000000001000010501"
  password    = "Newuser@123"
  auth_url    = "https://iam.eu-de.otc.t-systems.com/v3"
  region      = "eu-de"
  tenant_id   = "91d687759aed45d28b5f6084bc2fa8ad"
}


resource "opentelekomcloud_vpc_v1" "vpc_1" {
  name = "vpc_test-roh"
  cidr = "192.168.0.0/16"
}
resource "opentelekomcloud_vpc_v1" "vpc_2" {
  name = "vpc_test1-roh"
  cidr = "192.168.0.0/16"
}
resource "opentelekomcloud_vpc_peering_connection_v2" "peering_1" {
  name = "opentelekomcloud_peering"
  vpc_id = "${opentelekomcloud_vpc_v1.vpc_1.id}"
  peer_vpc_id = "${opentelekomcloud_vpc_v1.vpc_2.id}"
}
resource "opentelekomcloud_vpc_route_v2" "route_1" {
  type = "peering"
  nexthop = "${opentelekomcloud_vpc_peering_connection_v2.peering_1.id}"
  destination = "192.168.0.0/16"
  vpc_id = "${opentelekomcloud_vpc_v1.vpc_1.id}"
  timeouts {
    create = "5m"
    delete = "5m"
  }
}