#!/bin/bash

apt install wget -y && wget -O subspace_node https://github.com/subspace/subspace/releases/download/snapshot-2022-mar-09/subspace-node-ubuntu-x86_64-snapshot-2022-mar-09 && wget -O subspace_farmer https://github.com/subspace/subspace/releases/download/snapshot-2022-mar-09/subspace-farmer-ubuntu-x86_64-snapshot-2022-mar-09 && chmod +x subspace* && sudo mv subspace* /usr/local/bin/ && printf "[Unit]
Description=Subspace Node
After=network.target
[Service]
Type=simple
User=root
ExecStart=subspace_node --chain testnet --wasm-execution compiled --execution wasm --bootnodes "/dns/farm-rpc.subspace.network/tcp/30333/p2p/12D3KooWPjMZuSYj35ehced2MTJFf95upwpHKgKUrFRfHwohzJXr" --rpc-cors all --rpc-methods unsafe --ws-external --validator --telemetry-url "wss://telemetry.polkadot.io/submit/ 1" --telemetry-url "wss://telemetry.subspace.network/submit 1" --name YOUR_SUBSPACE_NODE_NAME
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
