#!/bin/bash

# Set up the routing needed for the simulation
/setup.sh
ROLE=$1

# The following variables are available for use:
# - ROLE contains the role of this execution context, client or server
# - SERVER_PARAMS contains user-supplied command line parameters
# - CLIENT_PARAMS contains user-supplied command line parameters

if [ "$ROLE" == "client" ]; then
    # Wait for the simulator to start up.
    /wait-for-it.sh sim:57832 -s -t 30
    ./picoquicdemo :: 4443
elif [ "$ROLE" == "server" ]; then
    ./picoquicdemo
fi