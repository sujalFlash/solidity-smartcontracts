// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
//inheritance  extrastorage is child of simplestorage
import "./basic.sol";
contract ExtraStorage is SimpleStorage{
//this inherites all methods of one contract by another contract
  //over riding the methods 
  //2 keywords are virtual and override,vitual in parent contract and override in child contract
  function store(uint256 _favouriteNumber)public override {
    favouriteNumber=_favouriteNumber+5;
  }
}