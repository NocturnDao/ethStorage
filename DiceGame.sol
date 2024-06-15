/**
 *Submitted for verification at Etherscan.io on 2024-06-06
*/

// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

contract DiceGame {
    function greeting() public view returns (string memory) {
        string[4] memory greetings = ["LFG, Degen!", "LFG, Love!", "Get rekt lol!", "Up Only!"];
        uint256 randomIndex = uint256(keccak256(abi.encodePacked(block.timestamp, block.prevrandao))) % 4;
        return greetings[randomIndex];
    }

    function rollDice(bool guessHigh) public view returns (string memory) {
        uint256 roll = uint256(keccak256(abi.encodePacked(block.timestamp, block.prevrandao, msg.sender))) % 6 + 1;
        if ((guessHigh && roll > 3) || (!guessHigh && roll <= 3)) {
            return string(abi.encodePacked("You win! The roll was ", uint2str(roll)));
        } else {
            return string(abi.encodePacked("You lose! The roll was ", uint2str(roll)));
        }
    }

    function uint2str(uint256 _i) internal pure returns (string memory) {
        if (_i == 0) {
            return "0";
        }
        uint256 j = _i;
        uint256 len;
        while (j != 0) {
            len++;
            j /= 10;
        }
        bytes memory bstr = new bytes(len);
        uint256 k = len;
        while (_i != 0) {
            k = k - 1;
            uint8 temp = (48 + uint8(_i - _i / 10 * 10));
            bytes1 b1 = bytes1(temp);
            bstr[k] = b1;
            _i /= 10;
        }
        return string(bstr);
    }
}