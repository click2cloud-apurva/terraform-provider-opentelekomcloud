
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

resource "opentelekomcloud_vpc_v1" "vpc_1_testcase2" {
  //name = "vpc_1_testcase2"
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



##TestCase3:  Negative scenario to verify resource getting created with invalid name parameter in opentelekomcloud_vpc_v1 resource.
resource "opentelekomcloud_vpc_v1" "vpc_1_testcase3" {
  name = "vpc 1_testcase3"
  cidr = "192.168.0.0/17"
}
resource "opentelekomcloud_vpc_v1" "vpc_2_testcase3" {
  name = "vpc_2_testcase3"
  cidr = "192.168.0.0/17"
}
resource "opentelekomcloud_vpc_peering_connection_v2" "peering_1_testcase3" {
  name = "peering_1_testcase3"
  vpc_id = "${opentelekomcloud_vpc_v1.vpc_1_testcase3.id}"
  peer_vpc_id = "${opentelekomcloud_vpc_v1.vpc_2_testcase3.id}"
}
resource "opentelekomcloud_vpc_route_v2" "route_1_testcase3" {
  type = "peering"
  nexthop = "${opentelekomcloud_vpc_peering_connection_v2.peering_1_testcase3.id}"
  destination = "192.168.0.0/17"
  vpc_id = "${opentelekomcloud_vpc_v1.vpc_2_testcase3.id}"

}

provisioner "local-exec" {
  command    = "echo first"
  on_failure = "continue"
}
