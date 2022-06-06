# Subspace-install

Official [github](https://github.com/subspace) and official [install node](https://github.com/subspace/subspace/blob/main/docs/farming.md)

# Subspace node install

   1. Download the executable:
   
    . <(wget -qO- https://raw.githubusercontent.com/notaprogrammer2019/Subspace-install/main/install.sh)
    
   2. Rename your node here:
    
    nano /etc/systemd/system/subspace-node.service
    ..
    --name YOUR_SUBSPACE_NODE_NAME
    ..
    
   3. Insert your wallet:
    
    nano /etc/systemd/system/subspace-farmer.service
    ..
    --reward-address YOUR_SUBSPACE_WALLET_ADDRESS
    ..    
    
   4.
   
    systemctl daemon-reload && systemctl enable subspace-node subspace-farmer && systemctl restart subspace-node subspace-farmer
   
   5. Checking results and interacting with farmnet. Visit [Polkadot.js explorer](https://polkadot.js.org/apps/?rpc=wss%3A%2F%2Ffarm-rpc.subspace.network#/explorer), from there you can interact with the Subspace Farmnet as any Substrate-based blockchain.
[Telemetry here](https://telemetry.subspace.network/#list/0x9ee86eefc3cc61c71a7751bba7f25e442da2512f408e6286153b3ccc055dccf0)
