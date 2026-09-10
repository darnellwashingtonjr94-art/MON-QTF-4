// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script, console} from "forge-std/Script.sol";
import {MonQTFExecution} from "../../contracts/MonQTFExecution.sol";

contract DeployMonQTF is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("DEPLOYER_PRIVATE_KEY");
        
        address[] memory initialNodes = new address[](2);
        initialNodes[0] = vm.addr(deployerPrivateKey);
        initialNodes[1] = 0x1234567890123456789012345678901234567890;

        vm.startBroadcast(deployerPrivateKey);

        MonQTFExecution executionContract = new MonQTFExecution(initialNodes);
        console.log("MonQTFExecution deployed at:", address(executionContract));

        vm.stopBroadcast();
    }
}
