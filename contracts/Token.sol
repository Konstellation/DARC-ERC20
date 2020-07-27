pragma solidity ^0.6.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v3.1.0/contracts/access/Ownable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v3.1.0/contracts/token/ERC20/ERC20Burnable.sol";

contract Token is ERC20Burnable, Ownable {
    /**
     * @dev Constructor that gives msg.sender all of existing tokens.
     */
    constructor () public ERC20("DARC", "DARC-ERC20") {
        _setupDecimals(8);
        _mint(msg.sender, 1000000000 * (10 ** uint256(decimals())));
    }

    /**
     * @dev Creates `amount` tokens and assigns them to owner,
     * increasing the total supply. Can only be called by the current owner.
     *
     * See {ERC20-_mint}.
     */
    function mint(uint256 amount) public virtual onlyOwner {
        _mint(owner(), amount);
    }
}
