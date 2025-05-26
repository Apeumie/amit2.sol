  // SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TimeLockVault {
    struct Deposit {
        uint256 amount;
        uint256 unlockTime;
    }

    mapping(address => Deposit) public deposits;

    event Deposited(address indexed user, uint256 amount, uint256 unlockTime);
    event Withdrawn(address indexed user, uint256 amount);

    // Deposit ETH with a time lock (in seconds)
    function deposit(uint256 _lockTimeInSeconds) external payable {
        require(msg.value > 0, "Must deposit some ETH");
        require(_lockTimeInSeconds > 0, "Lock time must be > 0");

        deposits[msg.sender] = Deposit({
            amount: msg.value,
            unlockTime: block.timestamp + _lockTimeInSeconds
        });

        emit Deposited(msg.sender, msg.value, block.timestamp + _lockTimeInSeconds);
    }

    // Withdraw ETH after lock time has passed
    function withdraw() external {
        Deposit storage userDeposit = deposits[msg.sender];
        require(userDeposit.amount > 0, "No funds to withdraw");
        require(block.timestamp >= userDeposit.unlockTime, "Funds are still locked");

        uint256 amount = userDeposit.amount;
        userDeposit.amount = 0;
        userDeposit.unlockTime = 0;

        payable(msg.sender).transfer(amount);

        emit Withdrawn(msg.sender, amount);
    }

    // View function to check how much time is left
    function timeLeft(address user) external view returns (uint256) {
        if (block.timestamp >= deposits[user].unlockTime) {
            return 0;
        } else {
            return deposits[user].unlockTime - block.timestamp;
        }
    }
}

