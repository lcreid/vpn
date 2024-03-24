#!/bin/bash

set -e

cp /tmp/${CLIENT_COMMON_NAME:?}.crt ~/client-configs/keys/
sudo cp ~/easy-rsa/ta.key ~/client-configs/keys/
sudo cp /etc/openvpn/ca.crt ~/client-configs/keys/
cd ~/client-configs
sudo ./make_config.sh $CLIENT_COMMON_NAME
