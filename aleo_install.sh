curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs -sSf | sh -s -- -y
source "$HOME/.cargo/env"
apt install git -y
git clone https://github.com/AleoHQ/snarkOS.git --depth 1
cd snarkOS
./build_ubuntu.sh
snarkos account new >>/root/aleo.key
wall=$(snarkos account new)
private_key=${wall:16:59}
view_key=${wall:91:53}
address=${wall:160:63}
echo "wallet: $wall"
echo "Private Key: $private_key"
echo "View Key: $view_key"
echo "Address: $address"
PROVER_PRIVATE_KEY=${private_key} ./run-prover.sh >>/root/aleo.log 2>&1 &
