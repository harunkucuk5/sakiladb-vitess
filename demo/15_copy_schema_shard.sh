#!/bin/bash
vtctlclient -server=TYPEYOURVTCTLDIPADDRESS:15999 CopySchemaShard -tables staff sakila/0 customer/-4000
vtctlclient -server=TYPEYOURVTCTLDIPADDRESS:15999 CopySchemaShard -tables staff sakila/0 customer/4000-8000
vtctlclient -server=TYPEYOURVTCTLDIPADDRESS:15999 CopySchemaShard -tables staff sakila/0 customer/8000-c000
vtctlclient -server=TYPEYOURVTCTLDIPADDRESS:15999 CopySchemaShard -tables staff sakila/0 customer/c000-
