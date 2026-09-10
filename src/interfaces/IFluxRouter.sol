// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IMonadDEX {
    function swap(address tokenIn, address tokenOut, uint256 amountIn) external returns (uint256 amountOut);
    function getReserves(address tokenA, address tokenB) external view returns (uint256 reserveA, uint256 reserveB);
}
