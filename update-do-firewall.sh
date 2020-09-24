#!/bin/bash

start=`date +"%Y-%m-%d %T"`
host=<dynamic domain>
firewall-id=<uuid>

add_rule() {
  local ip=$1
  doctl compute firewall update "${firewall-id}" --name Home --inbound-rules "protocol:tcp,ports:80,address:${ip} protocol:tcp,ports:22,address:${ip} protocol:tcp,ports:443,address:${ip}"
  echo "${start} Added rules for ${ip}"
}

ip=$(dig +short $host | tail -n 1)

if [ -z ${ip} ]; then
    echo "${start} Failed to resolve the ip address of ${host}." 1>&2
    exit 1
fi

add_rule "${ip}"
