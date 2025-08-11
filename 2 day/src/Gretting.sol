// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Gretting {
    string public name;
    string  public bio;

    function setInfo(string memory _name, string memory _bio) public {
        name = _name;
        bio = _bio;
    }

    function getInfo() public view returns (string memory, string memory) {
        return (name, bio);
    }

    function updateName(string memory _name) public {
        name = _name;
    }

    function updateBio(string memory _bio ) public {
        bio = _bio;
    }

   
}
