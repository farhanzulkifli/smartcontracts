// // SPDX-License-Identifier: MIT
// // OpenZeppelin Contracts v4.4.1

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract farhan_erc20 is ERC20 {
    constructor() ERC20("farhan_erc20", "FHNERC20") {
        _mint(msg.sender, 100000 * 10**decimals());
    }

    function _mint(address to, uint256 amount) internal override(ERC20) {
        require(
            totalSupply() + amount <= 1000000 * 10**decimals(),
            "Cap of 1m FHNERC20 reached"
        );
        super._mint(to, amount);
    }

    function mint (address to, uint256 amount) public{
        uint256 newNumber = amount *10**18;
        _mint(to,newNumber);
    }
}
