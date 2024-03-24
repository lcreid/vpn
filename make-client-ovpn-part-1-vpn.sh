#!/bin/bash

set -e

cd ~/easy-rsa
./easyrsa gen-req ${CLIENT_COMMON_NAME:?} nopass
cp pki/private/$CLIENT_COMMON_NAME.key ~/client-configs/keys/
rsync pki/reqs/$CLIENT_COMMON_NAME.req ${CA_HOSTNAME-ca}:/tmp
