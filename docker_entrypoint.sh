#!/bin/sh

# https://nwc.getalby.com/public/images/nwc-logo.svg

#

export RELAY="wss://relay.getalby.com/v1"

export LN_BACKEND_TYPE="LND"
export LND_ADDRESS="lnd.embassy:10009"      #the LND gRPC address, eg. localhost:10009 (used with the LND backend)
export LND_CERT_FILE="/mnt/lnd/tls.cert"    #the location where LND's tls.cert file can be found (used with the LND backend)
export LND_MACAROON_FILE="/mnt/lnd/admin.macaroon" #the location where LND's admin.macaroon file can be found (used with the LND backend)
export WORK_DIR="/data/albyhub"
export PORT=8080 #the port on which the app should listen on (default='blah' #8080)

export TOR_ADDRESS=$(yq e '.tor-address' /data/start9/config.yaml)
export LAN_ADDRESS=$(yq e '.lan-address' /data/start9/config.yaml)
export RELAY=$(yq e ".nostr-relay" /data/start9/config.yaml)

echo "Nostr Relay: " $RELAY
echo "LN Backend Type: " $LN_BACKEND_TYPE
echo "LN Address: " $LND_ADDRESS
echo "LND Cert: " $LND_CERT_FILE
echo "LND Macaroon: " $LND_MACAROON_FILE

# exec /bin/bash
exec /bin/main
