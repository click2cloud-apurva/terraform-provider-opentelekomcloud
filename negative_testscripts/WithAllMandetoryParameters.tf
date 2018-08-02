
##TestCase1:  To veify resources are created with all the mandetory parameters.

resource "opentelekomcloud_vpc_v1" "vpc_1_testcase5" {
  name = "vpc_1_testcase5"
  cidr = "192.168.0.0/16"
}
resource "opentelekomcloud_vpc_v1" "vpc_2_testcase5" {
  name = "vpc_2_testcase5"
  cidr = "192.168.0.0/16"
}
resource "opentelekomcloud_vpc_peering_connection_v2" "peering_1_testcase5" {
  name = "peering_1_testcase5"
  vpc_id = "${opentelekomcloud_vpc_v1.vpc_1_testcase5.id}"
  peer_vpc_id = "${opentelekomcloud_vpc_v1.vpc_2_testcase5.id}"
}
resource "opentelekomcloud_vpc_route_v2" "route_1_testcase5" {
  type = "peering"
  nexthop = "${opentelekomcloud_vpc_peering_connection_v2.peering_1_testcase5.id}"
  destination = "192.168.0.0/16"
  vpc_id = "${opentelekomcloud_vpc_v1.vpc_1_testcase5.id}"

}
