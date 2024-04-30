// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StakingContract {
    mapping(address => uint256) public stakingBalance;
    mapping(address => uint256) public rewardsBalance;
    mapping(address => uint256) public lastStakeTimestamp;

    uint256 public totalStaked;
    uint256 public totalRewards;

    event Staked(address indexed staker, uint256 amount);
    event Unstaked(address indexed staker, uint256 amount);
    event RewardClaimed(address indexed staker, uint256 amount);

    function stake(uint256 amount) external {
        require(amount > 0, "Amount must be greater than 0");

        stakingBalance[msg.sender] += amount;
        totalStaked += amount;
        lastStakeTimestamp[msg.sender] = block.timestamp;

        emit Staked(msg.sender, amount);
    }

    function unstake(uint256 amount) external {
        require(amount > 0, "Amount must be greater than 0");
        require(stakingBalance[msg.sender] >= amount, "Insufficient staked balance");

        uint256 reward = calculateReward(msg.sender);
        rewardsBalance[msg.sender] += reward;

        stakingBalance[msg.sender] -= amount;
        totalStaked -= amount;
        lastStakeTimestamp[msg.sender] = block.timestamp;

        emit Unstaked(msg.sender, amount);
    }

    function claimReward() external {
        uint256 reward = calculateReward(msg.sender);
        rewardsBalance[msg.sender] += reward;

        emit RewardClaimed(msg.sender, reward);
    }

    function calculateReward(address staker) internal view returns (uint256) {
        // Simple reward calculation example, replace with your own logic
        uint256 timeElapsed = block.timestamp - lastStakeTimestamp[staker];
        uint256 rewardPerSecond = 1; // Example reward rate
        return stakingBalance[staker] * rewardPerSecond * timeElapsed;
    }

    function getTotalStaked() external view returns (uint256) {
        return totalStaked;
    }

    function getTotalRewards() external view returns (uint256) {
        return totalRewards;
    }

    function getStakingBalance(address staker) external view returns (uint256) {
        return stakingBalance[staker];
    }

    function getRewardsBalance(address staker) external view returns (uint256) {
        return rewardsBalance[staker];
    }

    function getLastStakeTimestamp(address staker) external view returns (uint256) {
        return lastStakeTimestamp[staker];
    }
}
