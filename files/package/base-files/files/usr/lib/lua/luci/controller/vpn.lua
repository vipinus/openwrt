module("luci.controller.vpn", package.seeall)

function index()
        entry({"admin", "services", "vpn"}, cbi("vpn"), _("VPN"), 100)
        end
