// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract TestCoin is ERC20 {

    event FaucetEvent(address recipient, uint256 amount);

    constructor() ERC20("Test Coin", "TSC") {}

    function faucet(address to) external {
        uint256 amount = 100;
        _mint(to, amount);
        emit FaucetEvent(to, amount);
    }

}
