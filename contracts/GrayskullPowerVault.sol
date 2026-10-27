// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title GrayskullPowerVault
 * @dev By the Power of Grayskull Sovereign Invariant Protocol
 */
contract GrayskullPowerVault {
    address public champion; // Prince Adam / He-Man
    address public sorceress;
    uint256 public grayskullEnergyBalance;
    bool public swordOfPowerDrawn;

    event PowerOfGrayskullInvoked(address indexed champion, uint256 energyReleased);
    event SkeletorAttackRepelled(bytes32 threatHash);

    constructor(address _sorceress) {
        champion = msg.sender;
        sorceress = _sorceress;
        grayskullEnergyBalance = 1_000_000_000 ether;
    }

    function invokePowerOfGrayskull(bytes32 invocationHash) external {
        require(msg.sender == champion || msg.sender == sorceress, "Unworthy");
        swordOfPowerDrawn = true;
        uint256 powerRelease = 10_000 ether;
        require(grayskullEnergyBalance >= powerRelease, "Grayskull depleted");

        grayskullEnergyBalance -= powerRelease;
        emit PowerOfGrayskullInvoked(msg.sender, powerRelease);
    }

    function repelSkeletor(bytes32 threatHash) external {
        require(swordOfPowerDrawn, "Draw the Sword of Power first");
        emit SkeletorAttackRepelled(threatHash);
    }
}
