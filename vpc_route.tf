
##TestCase1:  Positive scenario to verify resources are created successfully.

resource "opentelekomcloud_vpc_v1" "vpc_1_testcase1" {
  name = "vpc_1_testcase1"
  cidr = "192.168.0.0/16"
}
resource "opentelekomcloud_vpc_v1" "vpc_2_testcase1" {
  name = "vpc_2_testcase1"
  cidr = "192.168.0.0/16"
}
resource "opentelekomcloud_vpc_peering_connection_v2" "peering_1_testcase1" {
  name = "peering_1_testcase1"
  vpc_id = "${opentelekomcloud_vpc_v1.vpc_1_testcase1.id}"
  peer_vpc_id = "${opentelekomcloud_vpc_v1.vpc_2_testcase1.id}"
}
resource "opentelekomcloud_vpc_route_v2" "route_1_positivetestcase" {
  type = "peering"
  nexthop = "${opentelekomcloud_vpc_peering_connection_v2.peering_1_testcase1.id}"
  destination = "192.168.0.0/16"
  vpc_id = "${opentelekomcloud_vpc_v1.vpc_1_testcase1.id}"

}


##TestCase2:  Negative scenario to verify resource getting created with invalid name parameter in opentelekomcloud_vpc_v1 resource.

/*
resource "opentelekomcloud_vpc_v1" "vpc_1_negativetestcase" {
  name = "vpc_test-roh2"
  cidr = "192.168.0.0/17"
}
resource "opentelekomcloud_vpc_v1" "vpc_2_negativetestcase" {
  name = "vpc_test1-roh2"
  cidr = "192.168.0.0/17"
}
resource "opentelekomcloud_vpc_peering_connection_v2" "peering_1_negativetestcase" {
  name = "opentelekomcloud_peering2"
  vpc_id = "${opentelekomcloud_vpc_v1.vpc_1_negativetestcase.id}"
  peer_vpc_id = "${opentelekomcloud_vpc_v1.vpc_2_negativetestcase.id}"
}
resource "opentelekomcloud_vpc_route_v2" "route_1_negativetestcase" {
  type = "peering"
  nexthop = "${opentelekomcloud_vpc_peering_connection_v2.peering_1_negativetestcase.id}"
  destination = "192.168.0.0/17"
  vpc_id = "${opentelekomcloud_vpc_v1.vpc_2_negativetestcase.id}"

}
*/
