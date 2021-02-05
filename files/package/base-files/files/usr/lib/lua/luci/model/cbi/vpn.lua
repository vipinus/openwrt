require("luci.sys")

m = Map("vpn", translate("VPN"), translate("www.7x24hrs.com"))

s = m:section(TypedSection, "login", "")
s.addremove = false
s.anonymous = true

name = s:option(Value, "username", translate("Username"))
pass = s:option(Value, "password", translate("Password"))
pass.password = true

local apply = luci.http.formvalue("cbi.apply")
if apply then
end

return m
