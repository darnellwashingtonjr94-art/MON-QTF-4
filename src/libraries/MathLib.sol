// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

library MathLib {
    function calculateSpread(uint256 priceA, uint256 priceB) internal pure returns (uint256 spread, bool positive) {
        if (priceA >= priceB) {
            return (priceA - priceB, true);
        } else {
            return (priceB - priceA, false);
        }
    }
}
