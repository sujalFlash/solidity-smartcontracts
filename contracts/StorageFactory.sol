// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "./basic.sol";

contract StoragaFactory{
    // creating a function to deploy another contract
    //creating array to track  deployed contracts
        SimpleStorage[] public simpleStorageArray;
        function createSimpleStorageContract() public{

          SimpleStorage simpleStorage=new SimpleStorage();
           simpleStorageArray.push(simpleStorage);
        }

           //interacting  with other contracts
           function sfStore(uint256 _simpleStorageIndex,uint256 _simpleStorageNumber) public{
            //to interact woith 2 contract we need address of contract and abi of the ocntract
       //we need object of that contract
       //contract object of SimpleStorage of particular deplyment using index of ordering deployments
       SimpleStorage simpleStorage=simpleStorageArray[_simpleStorageIndex];
       simpleStorage.store(_simpleStorageNumber);

        

            
           }
           function sfget(uint256 _simpleStorageIndex)public view returns(uint256){
            SimpleStorage simpleStorage=simpleStorageArray[_simpleStorageIndex];
            return simpleStorage.retrieve();
           }
        }

