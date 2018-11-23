module("luci.controller.zerotier",package.seeall)

function index()
  if not nixio.fs.access("/etc/config/zerotier")then
return
end

entry({"admin","vpn"}, firstchild(), "VPN", 45).dependent = false
entry({"admin","vpn","zerotier"},cbi("zerotier"),_("ZeroTier"),90).dependent=true
entry({"admin","vpn","zerotier","status"},call("act_status")).leaf=true
end

function act_status()
local e={}
  e.running=luci.sys.call("pgrep /usr/bin/zerotier-one >/dev/null")==0
  luci.http.prepare_content("application/json")
  luci.http.write_json(e)
end
