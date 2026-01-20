// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

contract TokenSale {
    address public owner;
    uint256 public priceWei;
    bool public paused;

    event Bought(address indexed buyer, uint256 amountWei);
    event Paused(bool status);

    constructor(uint256 _priceWei) {
        owner = msg.sender;
        priceWei = _priceWei;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    function buy() external payable {
        require(!paused, "Sale paused");
        require(msg.value >= priceWei, "Not enough ETH");
        emit Bought(msg.sender, msg.value);
    }

    function setPaused(bool _paused) external onlyOwner {
        paused = _paused;
        emit Paused(_paused);
    }
}

