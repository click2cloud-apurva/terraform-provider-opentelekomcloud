
##TestCase2:  To verify resource is created with invalid name value.

resource "opentelekomcloud_vpc_v1" "vpc_1_testcase2" {
  name = "vpc 1_testcase2"
  cidr = "192.168.0.0/17"
}
resource "opentelekomcloud_vpc_v1" "vpc_2_testcase2" {
  name = "vpc_2_testcase2"
  cidr = "192.168.0.0/17"
}
resource "opentelekomcloud_vpc_peering_connection_v2" "peering_1_testcase2" {
  name = "peering_1_testcase2"
  vpc_id = "${opentelekomcloud_vpc_v1.vpc_1_testcase2.id}"
  peer_vpc_id = "${opentelekomcloud_vpc_v1.vpc_2_testcase2.id}"
}
resource "opentelekomcloud_vpc_route_v2" "route_1_testcase2" {
  type = "peering"
  nexthop = "${opentelekomcloud_vpc_peering_connection_v2.peering_1_testcase2.id}"
  destination = "192.168.0.0/17"
  vpc_id = "${opentelekomcloud_vpc_v1.vpc_2_testcase2.id}"

}
