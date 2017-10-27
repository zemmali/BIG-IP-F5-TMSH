#!/bin/bash

echo "############################# Create and configure Nodes ############################################"
echo "#####################################################################################################"
echo " Suppresion d'un node"
tmsh delete ltm node N1-HTTP
tmsh delete ltm node N1-HTTP

echo "Create Nodes with default Monitor"
tmsh create ltm node N1-HTTP address @IP-NODE1 monitor default
tmsh create ltm node N2-HTTP address @IP-NODE2 monitor default

echo "Suppresion d'un node"
tmsh delete ltm node N3-HTTP

echo "Create node with HTTPS Monitor"
tmsh create ltm node N3-HTTP description Node HTTPS address @IP-NODE3 monitor https_443

echo "Edit node monitor"
tmsh modify ltm node N3-HTTP monitor default

echo "Show Node"
tmsh list ltm node state 

echo "Show Node with metadata ratio session"
tmsh list ltm node metadata ratio session

echo "Show Node 1 details"
tmsh list ltm node  N1-HTTP session
