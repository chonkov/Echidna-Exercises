// SPDX-License-Identifier: MIT
pragma solidity =0.7.0;

contract Ownable {
    address public owner = msg.sender;

    modifier onlyOwner() {
        require(msg.sender == owner, "Ownable: Caller is not the owner.");
        _;
    }
}

contract Pausable is Ownable {
    bool private _paused;

    function paused() public view returns (bool) {
        return _paused;
    }

    function pause() public onlyOwner {
        _paused = true;
    }

    function resume() public onlyOwner {
        _paused = false;
    }

    modifier whenNotPaused() {
        require(!_paused, "Pausable: Contract is paused.");
        _;
    }
}

contract Token is Ownable, Pausable {
    mapping(address => uint256) public balances;

    function transfer(address to, uint256 value) public whenNotPaused {
        require(balances[msg.sender] >= value, "Underflow");
        balances[msg.sender] -= value;
        balances[to] += value;
    }
}

contract TestToken is Token {
    address echidna_caller = msg.sender;

    constructor() {
        balances[echidna_caller] = 10_000;
    }

    // docker run --platform=linux/amd64 --rm -it -v `pwd`:/src ghcr.io/crytic/echidna/echidna bash -c "solc-select install 0.7.0 && solc-select use  0.7.0 && echidna --contract TokenEchidna src/TokenEchidna.sol --config src/config.yaml"
    // docker run --platform=linux/amd64 --rm -it -v $PWD:/output ghcr.io/crytic/echidna/echidna bash -c "solc-select install 0.7.0 && solc-select use  0.7.0 && echidna --contract TokenEchidna src/TokenEchidna.sol --config src/config.yaml"
    // docker run --rm -it -v `pwd`:/test ghcr.io/crytic/echidna/echidna bash -c "solc-select install 0.7.0 && solc-select use  0.7.0 && echidna --contract TestToken"
    function echidna_test_balance() public view returns (bool) {
        return balances[echidna_caller] <= 10_000;
    }
}
