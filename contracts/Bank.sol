//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract Bank {
    address private owner;
    mapping(address => uint256) transferBlanace; //记录转账的地址和金额 

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == owner,"Only owner can call this function.");
        _;
    }

    receive() external payable {
        transferBlanace[msg.sender] = msg.value;
    }

    function withdraw() public onlyOwner{
        payable(msg.sender).transfer(address(this).balance);
    }
}
