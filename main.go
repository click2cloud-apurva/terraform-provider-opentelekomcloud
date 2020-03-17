package main

import (
	"github.com/click2cloud-apurva/terraform-provider-opentelekomcloud/opentelekomcloud"
	"github.com/hashicorp/terraform/plugin"
)

func main() {
	plugin.Serve(&plugin.ServeOpts{
		ProviderFunc: opentelekomcloud.Provider})
}
