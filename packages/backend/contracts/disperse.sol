// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Disperse {

    // function disperseEth(address[] memory recipients, uint256[] memory values ) external payable {
    //     for (uint256 i=0;i <recipients.length; i++) {
    //         payable(recipients[i]).transfer(values[i]);
    //     }
    //     uint256 balance = address(this).balance;
    //     if (balance > 0) {
    //         payable(msg.sender).transfer(balance);
    //     }
    // }
    
    uint256 balance = address(this).balance;

    function transferETH(address[] memory recipients, uint256[] memory values ) external payable{

        for(uint256 i=0;i<recipients.length;i++) {
            payable(recipients[i]).transfer(values[i]);
        }

        // uint256 balance = address(this).balance;
        if (balance > 0) {
            payable(msg.sender).transfer(balance);
        }
        
    }        
    
    
     function retrieveBalance() public view returns(uint256) {
        return balance;
    }

    function disperseToken(IERC20 tokenAddress, address[] calldata recipients, uint256[] calldata values) external {
        IERC20 token = IERC20(tokenAddress);
        uint256 total = 0;
        for (uint256 i=0;i <recipients.length; i++) {
            total += values[i];
            // payable(recipients[i]).transfer(values[i]);
        }
        require(token.transferFrom(msg.sender, address(this), total));
        // uint256 balance = address(this).balance;
        for (uint256 i=0;i <recipients.length; i++) {
            require(token.transfer(recipients[i], values[i]));
        }
    }
}
