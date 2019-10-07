vtctlclient -server=TYPEYOURVTCTLDIPADDRESS:15999 ApplyRoutingRules -rules='{"rules":[{"fromTable":"staff","toTables":["sakila.staff","customer.staff"]}]}'
