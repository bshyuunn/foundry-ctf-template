import json
from pathlib import Path

import eth_sandbox
import eth_sandbox.launcher
from web3 import Web3

import os

SETUP_CONTRACT_VALUE = int(os.getenv("SETUP_CONTRACT_VALUE", "0"))
USER_VALUE = int(os.getenv("USERVALUE", "100000000"))

def deploy(web3: Web3, deployer_address: str, player_address: str) -> str:
    receipt = eth_sandbox.launcher.send_transaction(
        web3,
        {
            "from": deployer_address,
            "data": json.loads(
                Path("compiled/Setup.sol/Setup.json").read_text()
            )["bytecode"]["object"],
            "value": SETUP_CONTRACT_VALUE,
        },
    )
    assert receipt is not None
    challenge_addr = receipt["contractAddress"]
    assert challenge_addr is not None

    eth_sandbox.launcher.send_transaction(
        web3,
        {"from": deployer_address, "to": player_address, "value": USER_VALUE},
    )

    return challenge_addr


eth_sandbox.launcher.run_launcher(
    [
        eth_sandbox.launcher.new_launch_instance_action(deploy),
        eth_sandbox.launcher.new_kill_instance_action(),
        eth_sandbox.launcher.new_get_flag_action(),
    ]
)
