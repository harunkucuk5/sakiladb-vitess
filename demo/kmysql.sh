#!/bin/bash

host="TYPEYOURVTGATEIPADDRESS"
port=3306

mysql -h "$host" -P "$port" $*
