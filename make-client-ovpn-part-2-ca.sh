#!/bin/bash

set -e

cd ~/easy-rsa
./easyrsa import-req /tmp/${CLIENT_COMMON_NAME:?}.req $CLIENT_COMMON_NAME
./easyrsa sign-req client $CLIENT_COMMON_NAME
rsync pki/issued/$CLIENT_COMMON_NAME.crt ${VPN_HOSTNAME:?}:/tmp
