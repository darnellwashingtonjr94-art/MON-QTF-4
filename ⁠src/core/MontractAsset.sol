// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract MontractAsset {
    string public name = "Mon-QTF Resource Asset";
    string public symbol = "MQRA";
    
    mapping(address => uint256) public balanceOf;
    uint256 public totalSupply;

    event Mint(address indexed to, uint256 amount);

    function mint(address to, uint256 amount) external {
        totalSupply += amount;
        balanceOf[to] += amount;
        emit Mint(to, amount);
    }
}
