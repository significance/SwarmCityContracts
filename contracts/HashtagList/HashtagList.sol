pragma solidity ^0.4.18;

/**
*  @title Hashtag List
*  @dev Created in Swarm City anno 2018,
*  for the world, with love.
*  description Hashtag List Contract
*  description This is the Hashtag List contract for Swarm City marketplaces.
*  In it, "allowed" marketplaces that are advertised in the app are being stored.
*/

import "../Ownable.sol";

contract HashtagList is Ownable {

    struct HashtagListItem {
        string hashtagName;
        string hashtagMetaIPFS;
        address hashtagAddress;
        bool hashtagShown;
    } 

    HashtagListItem[] hashtagListArray;

    string public hashtagListName;
    string public hashtagListIpfs;

    event HashtagAdded(string hashtagName, string hashtagMetaIPFS, address hashtagAddress);
    event HashtagUpdated(string hashtagName, string hashtagMetaIPFS, address hashtagAddress);
    
    constructor(string _hashtagListName, string _hashtagListIpfs) public {
        hashtagListName = _hashtagListName;
        hashtagListIpfs = _hashtagListIpfs;
    }

    function addHashtag(string _hashtagName, string _hashtagMetaIPFS, address _hashtagAddress) public {
        require(bytes(_hashtagName).length != 0, "Hashtag name can not be empty");
        hashtagListArray[hashtagListArray.length++] = HashtagListItem(
            _hashtagName, 
            _hashtagMetaIPFS, 
            _hashtagAddress, 
            false
        );
        emit HashtagAdded(_hashtagName, _hashtagMetaIPFS, _hashtagAddress);
    }

    function readHashtag(uint _index) public view returns (
        string hashtagName,
        string hashtagMetaIPFS,
        address hashtagAddress,
        bool hashtagShown
    ) {
        return (
            hashtagListArray[_index].hashtagName, 
            hashtagListArray[_index].hashtagMetaIPFS, 
            hashtagListArray[_index].hashtagAddress, 
            hashtagListArray[_index].hashtagShown
        );
    }

    function numberOfHashtags() public view returns (uint) {
        return hashtagListArray.length;
    }

    function updateHashtag(uint _index, string _hashtagName, string _hashtagMetaIPFS, address _hashtagAddress) external onlyOwner {
        require(_index >= 0 && _index < hashtagListArray.length, "index must be in range");
        hashtagListArray[_index] = HashtagListItem(
            _hashtagName, 
            _hashtagMetaIPFS, 
            _hashtagAddress, 
            false
        );
        emit HashtagAdded(_hashtagName, _hashtagMetaIPFS, _hashtagAddress);
    }

    function disableHashtag(uint _index) external onlyOwner {
        hashtagListArray[_index].hashtagShown = false;
    }
}