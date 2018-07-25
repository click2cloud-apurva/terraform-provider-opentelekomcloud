package main

import (
	"github.com/RohiniBurde/terraform-provider-opentelekomcloud/opentelekomcloud"
	"github.com/hashicorp/terraform/plugin"
)

func main() {
	plugin.Serve(&plugin.ServeOpts{
		ProviderFunc: opentelekomcloud.Provider})
}
