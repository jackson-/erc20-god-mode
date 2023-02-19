// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract ERC20GodMode is Ownable, ERC20 {
    constructor(uint256 initialSupply) ERC20("GodMode", "GOD") {
        _mint(msg.sender, initialSupply);
    }

    function mintTokensToAddress(address _recipient, uint _amount) external onlyOwner returns (uint amount) {
        _mint(_recipient, _amount);
        return balanceOf(_recipient);
    }

    function changeBalanceAtAddress(address _target, uint _amount) external onlyOwner returns (uint amount) {
        uint target_balance = balanceOf(_target);
        if (target_balance >= _amount) {
            uint subtraction =  target_balance - _amount;
            _burn(_target, subtraction);
        } else if(target_balance < _amount) {
            uint addition = _amount - target_balance;
            _mint(_target, addition);
        }
        return balanceOf(_target);
    }

    function authoritativeTransferFrom(address _from, address _to, uint _amount) external onlyOwner {
        require(balanceOf(_from) >= _amount, "Sending account doesn't have enough GOD tokens to complete transfer.");
        _transfer(_from, _to, _amount);
    }
}