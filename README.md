Core Features:
Staking: Users can stake a certain amount of tokens by calling the stake function with the desired amount. Staked tokens are added to the user's staking balance and contribute to the total staked amount.
Unstaking: Users can unstake a certain amount of tokens by calling the unstake function with the desired amount. Unstaking removes tokens from the user's staking balance and updates the total staked amount accordingly. Upon unstaking, users receive any accrued rewards.
Reward Claiming: Users can claim their accrued rewards by calling the claimReward function. Rewards are calculated based on the time since the user's last stake and the amount staked. Claimed rewards are added to the user's rewards balance.
Reward Calculation: The contract calculates rewards using a simple mechanism. The reward rate is defined per second, and rewards are calculated based on the time elapsed since the user's last stake and the amount staked.
Additional Functions:
Total Staked: Users can query the total amount of tokens staked in the contract by calling the getTotalStaked function.
Total Rewards: Users can query the total amount of rewards accrued in the contract by calling the getTotalRewards function.
Staking Balance: Users can query their own staking balance by calling the getStakingBalance function with their address as an argument.
Rewards Balance: Users can query their own rewards balance by calling the getRewardsBalance


Contract deployed and verified on scroll Sepolia https://sepolia.scrollscan.com/address/0x6f72d1af4e1469d540f387ff03176bbf5c601222
