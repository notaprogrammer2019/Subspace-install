#!/bin/bash

apt install wget -y && wget -O subspace_node https://github.com/subspace/subspace/releases/download/gemini-1a-2022-may-31/subspace-node-ubuntu-x86_64-gemini-1a-2022-may-31 && wget -O subspace_farmer https://github.com/subspace/subspace/releases/download/gemini-1a-2022-may-31/subspace-farmer-ubuntu-x86_64-gemini-1a-2022-may-31 && chmod +x subspace* && sudo mv subspace* /usr/local/bin/ && printf "[Unit]
Description=Subspace Node
After=network.target
[Service]
Type=simple
User=root
ExecStart=subspace_node --chain gemini-1 --wasm-execution compiled --execution wasm --port 30333 --rpc-cors all --rpc-methods safe --unsafe-ws-external --validator --name INSERT_NAME_NODE
Restart=on-failure
RestartSec=10
[Install]
WantedBy=multi-user.target" > /etc/systemd/system/subspace-node.service && printf "[Unit]
Description=Subspace Farmer
Requires=subspace-node.service
After=network.target
After=subspace-node.service
[Service]
Type=simple
User=root
ExecStart=subspace_farmer farm --reward-address YOUR_SUBSPACE_WALLET_ADDRESS
Restart=on-failure
RestartSec=10
[Install]
WantedBy=multi-user.target" > /etc/systemd/system/subspace-farmer.service
