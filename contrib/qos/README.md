### QoS (Quality of service) ###

This is a Linux bash script that will set up tc to limit the outgoing bandwidth for connections to the OduwaUSD_Coin network. It limits outbound TCP traffic with a source or destination port of 2520, but not if the destination IP is within a LAN.

This means one can have an always-on oduwausd_coind instance running, and another local oduwausd_coind/oduwausd_coin-qt instance which connects to this node and receives blocks from it.
