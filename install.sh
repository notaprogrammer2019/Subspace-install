#!/bin/bash

ver=`wget -qO- https://api.github.com/repos/subspace/subspace/releases/latest | jq -r ".tag_name"`

apt install wget jq ocl-icd-opencl-dev libopencl-clang-dev libgomp1 -y && wget -O subspace_node https://github.com/subspace/subspace/releases/download/${ver}/subspace-node-ubuntu-x86_64-${ver} && wget -O subspace_farmer https://github.com/subspace/subspace/releases/download/${ver}/subspace-farmer-ubuntu-x86_64-${ver} && chmod +x subspace* && sudo mv subspace* /usr/local/bin/ && printf "[Unit]
Description=Subspace Node
After=network.target
[Service]
Type=simple
User=root
ExecStart=subspace_node --chain gemini-1 --execution wasm --pruning 1024 --keep-blocks 1024 --validator --name INSERT_NAME_NODE
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
ExecStart=subspace_farmer farm --reward-address YOUR_SUBSPACE_WALLET_ADDRESS --plot-size 100G
Restart=on-failure
RestartSec=10
[Install]
WantedBy=multi-user.target" > /etc/systemd/system/subspace-farmer.service
