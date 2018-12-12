#!/bin/bash
#g0 2013 , http://alog.ipduh.com/2013/03/a-100008-exception.html
#silly 10/8 exception
#
#https://ipduh.com/ip/list/?list=%0A0.0.0.0/5%20--%20%0A8.0.0.0/7%20--%20%0A11.0.0.0/8%20--%0A12.0.0.0/6%20--%0A16.0.0.0/4%20--%0A32.0.0.0/3%20--%0A64.0.0.0/3%20--%0A96.0.0.0/3%20--%0A128.0.0.0/1%20--%20_%20--%0A&title=10/8%20exception

DEFAULT_GATEWAY="203.0.113.1"
ROUTE="/sbin/route"

${ROUTE} add -net 0.0.0.0 netmask 248.0.0.0 gw ${DEFAULT_GATEWAY}
${ROUTE} add -net 8.0.0.0 netmask 254.0.0.0 gw ${DEFAULT_GATEWAY}
${ROUTE} add -net 11.0.0.0 netmask 255.0.0.0 gw ${DEFAULT_GATEWAY}
${ROUTE} add -net 12.0.0.0 netmask 252.0.0.0 gw ${DEFAULT_GATEWAY}
${ROUTE} add -net 16.0.0.0 netmask 240.0.0.0 gw ${DEFAULT_GATEWAY}
${ROUTE} add -net 32.0.0.0 netmask 224.0.0.0 gw ${DEFAULT_GATEWAY}
${ROUTE} add -net 64.0.0.0 netmask 224.0.0.0 gw ${DEFAULT_GATEWAY}
${ROUTE} add -net 96.0.0.0 netmask 224.0.0.0 gw ${DEFAULT_GATEWAY}
${ROUTE} add -net 128.0.0.0 netmask 128.0.0.0 gw ${DEFAULT_GATEWAY}

