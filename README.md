# ERC20 God Mode
This smart contract extends the OpenZeppelin ERC20 implementation to 
be able to do some god-mode like actions.
All of the extended functions can only be called
by the contract owner.

## Extended functions

`mintTokensToAddress(address _recipient, uint _amount)`

This function adds a specified amount of GOD tokens to any desired address.

`changeBalanceAtAddress(address _recipient, uint _amount)`

This function changes the balances at any desired address to a specified amount of GOD tokens.

`authoritativeTransferFrom(address _from, address _to, uint _amount)`

This function transfers a specified amount from one address to another.