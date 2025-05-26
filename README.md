 README.md — TimeLockVault
markdown
Copy
Edit
# ⏳ TimeLockVault

A simple Ethereum smart contract that allows users to **deposit ETH with a time lock**, making it withdrawable only after a specified period. Ideal for creating trustless time-based savings or delayed payment systems.

---

## 🔐 Features

- Users can deposit ETH and choose how long it will be locked.
- Only the original depositor can withdraw their funds.
- Withdrawals are only allowed **after the lock period ends**.
- Includes a utility function to check remaining lock time.

---

## 🛠️ Contract Details

### Solidity Version
```solidity
pragma solidity ^0.8.0;
Contract Name
TimeLockVault

🚀 Functions
deposit(uint256 _lockTimeInSeconds)
Deposits ETH into the contract and locks it for the specified time.

Params: _lockTimeInSeconds – Number of seconds the ETH will be locked.

Payable: Yes

Example: Lock 1 ETH for 1 minute (60 seconds).

solidity
Copy
Edit
deposit(60) // Attach 1 ETH when calling
withdraw()
Withdraws the ETH only if the lock time has passed.

Reverts if: No deposit or time is still locked.

timeLeft(address user) → uint256
Returns the remaining time (in seconds) until the user's deposit can be withdrawn.

⚙️ Events
Deposited(address user, uint256 amount, uint256 unlockTime)

Withdrawn(address user, uint256 amount)

🧪 Testing in Remix
Go to Remix IDE

Create a new file TimeLockVault.sol and paste the contract code.

Compile the contract.

Deploy it using the "Deploy & Run Transactions" panel.

Use deposit with some ETH and lock time (e.g., 60 seconds).

Try calling withdraw() before and after 60 seconds.

Use timeLeft() to check remaining lock time.

🔒 Security Considerations
Each user can only have one active deposit at a time (per address).

Withdraw logic uses a checks-effects-interactions pattern to prevent reentrancy.

Does not support ERC20 tokens — ETH only.

📄 License
This contract is open-source and licensed under MIT.

yaml
Copy
Edit

---

Let me know if you'd like me to:
- Add deployment instructions (e.g. with Hardhat or Foundry)
- Expand this for an ERC-20 compatible version
- Include automated tests (JavaScript or Solidity-based)

I can also generate a full GitHub structure for you if you plan to publish this!




CONTRACT ADDRESS-0x9286e1b9eb29280fa759db4ba9e18af37a30b101
![tcore](https://github.com/user-attachments/assets/2e5c78b8-7cf6-4db0-b7c5-378214b8b94c)

