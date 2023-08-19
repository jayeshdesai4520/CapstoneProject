// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract FarmToken is ERC20 {
    address public admin;

    struct FarmOwner {
        uint256 acres;
        uint256 tokenBalance;
    }

    mapping(address => FarmOwner) public owners;
    address[] public ownerAddresses;

    constructor() ERC20("FarmToken", "FTK") {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Only admin can call this");
        _;
    }

    function mintTokens(address account, uint256 amount, uint256 acres) public onlyAdmin {
        _mint(account, amount);
        owners[account].acres = acres;
        owners[account].tokenBalance = amount;
        ownerAddresses.push(account);
    }

    function distributeProfit(uint256 totalTokensToDistribute) public onlyAdmin {
        uint256 totalTokens = totalSupply();
        require(totalTokens > 0, "Total tokens must be greater than 0");

        uint256 totalAcres = 100; // Total acres representing the land value

        for (uint256 i = 0; i < ownerAddresses.length; i++) {
            address owner = ownerAddresses[i];
            uint256 landValue = owners[owner].acres;

            uint256 tokensToDistribute = (totalTokensToDistribute * landValue) / totalAcres;
            owners[owner].tokenBalance += tokensToDistribute;
        }
    }

    function getOwnerAddresses() public view returns (address[] memory) {
        return ownerAddresses;
    }
}
