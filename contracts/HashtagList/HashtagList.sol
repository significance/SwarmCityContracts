pragma solidity ^0.4.23;

/**
*  @title Hashtag List
*  @dev Created in Swarm City anno 2018,
*  for the world, with love.
*  description Hashtag List Contract
*  description This is the Hashtag List contract for Swarm City marketplaces.
*  In it, "allowed" marketplaces that are advertised in the app are being stored.
*/

import "../Ownable.sol";
import "./IPFSEvents.sol";


contract HashtagList is IPFSEvents, Ownable {

    struct hashtagListItem {
        string hashtagName;
        string hashtagMetaIPFS;
        address hashtagAddress;
        bool hashtagShown;
    } 

    hashtagListItem[] hashtagListArray;

    uint public defaultTTL;
    
    event HashtagAdded(string hashtagName, string hashtagMetaIPFS, address hashtagAddress);
    
    function addHashtag(string _hashtagName, string _hashtagMetaIPFS, address _hashtagAddress) onlyOwner external {
        require(bytes(_hashtagName).length != 0);
        uint indexHashtag = hashtagListArray.length++;
        hashtagListItem storage c = hashtagListArray[indexHashtag];
        c.hashtagName = _hashtagName;
        c.hashtagMetaIPFS = _hashtagMetaIPFS;
        c.hashtagAddress = _hashtagAddress;
        c.hashtagShown = true; 
        emit HashtagAdded(_hashtagName, _hashtagMetaIPFS, _hashtagAddress);
    }

    function readHashtag(uint _index) constant public returns (
        string hashtagName,
        string hashtagMetaIPFS,
        address hashtagAddress,
        bool hashtagShown) {
        hashtagListItem storage c = hashtagListArray[_index];
        return (c.hashtagName, c.hashtagMetaIPFS, c.hashtagAddress, c.hashtagShown);
    }

    function numberOfHashtags() view public returns (uint) {
        return hashtagListArray.length;
    }
}