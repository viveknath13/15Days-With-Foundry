// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract SimpleBank {
    error InvalidAmountToDeposit();
    error InsufficientBalance();
    error InvalidAddress();
    error TransferFailed();

    address owner;
    string public BankName;

    mapping(address => uint256) balances;

    constructor(string memory _bankName) {
        owner = msg.sender;
        BankName = _bankName;
    }

    function deposit() public payable {
        if (msg.value == 0) {
            revert InvalidAmountToDeposit();
        }
        balances[msg.sender] += msg.value;
    }

    function withdraw(address recipient, uint256 amount) public {
        if (amount > balances[msg.sender]) {
            revert InsufficientBalance();
        }
        if (recipient == address(0)) {
            revert InvalidAddress();
        }

        balances[msg.sender] -= amount;
        (bool success,) = payable(recipient).call{value: amount}("");
        if (!success) {
            revert TransferFailed();
        }
    }

    function getBankBalance() public view returns (uint256) {
        require(msg.sender == owner, "You are not the owner");
        return (address(this).balance);
    }

    function getCustomerBalance() public view returns (uint256) {
        return balances[msg.sender];
    }
}
