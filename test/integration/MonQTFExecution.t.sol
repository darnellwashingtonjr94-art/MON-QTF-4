// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test, console} from "forge-std/Test.sol";
import {MonQTFExecution} from "../../contracts/MonQTFExecution.sol";

contract MonQTFExecutionTest is Test {
    MonQTFExecution qtf;
    address node = address(0x1);

    function setUp() public {
        address[] memory nodes = new address[](1);
        nodes[0] = node;
        qtf = new MonQTFExecution(nodes);
    }

    function testNodeAuthorization() public view {
        assertTrue(qtf.authorizedNodes(node));
        assertFalse(qtf.authorizedNodes(address(0x999)));
    }
}
