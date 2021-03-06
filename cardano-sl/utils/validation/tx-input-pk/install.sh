#!/usr/bin/env bash

function detect() {
    if [[ -z "$(which $1)" ]]; then
      echo "[ERROR] No $1 detected! Exiting."
      exit 1
    fi;
    echo "$1 is detected"
}

echo 'Trying to install the `validate-cardano-tx-input-pk.py` script'
detect python3

echo 'Installing dependencies'
python3 -m pip install base58 cbor requests

echo 'Downloading script'
mkdir -p ~/.local/script
curl -s 'https://raw.githubusercontent.com/antipalos/vivliothiki/f204af941e1003490ccb18456a7517ce8d1680a1/cardano-sl/utils/validation/tx-input-pk/validate-cardano-tx-input-pk.py' > ~/.local/script/validate-cardano-tx-input-pk.py

echo 'Linking the script'
echo 'python3 ~/.local/script/validate-cardano-tx-input-pk.py' > /usr/local/bin/validate-cardano-tx-input-pk
chmod +x /usr/local/bin/validate-cardano-tx-input-pk

echo 'Script is installed, try calling `validate-cardano-tx-input-pk`'