// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";



//get funds from users
//withdraw funds
contract FundMe{
  address[] public funders;
  mapping(address=>uint256) public addressToAmoundFunded;
    uint public number;
    uint256 public minimumUsd=50*1e18;
    function fund() public payable {
      //able to set a minimum fund amount in USD
        //sending eth to this contract
          //value field sets how much ether we are trying send
      //payable keyword ke this function payable
      //the global keyword to alter msg.val 
      require( msg.value > 1e18,"Didnt send enough");
      // 1e18 =1*10**18==1ether in wei
      //2nd arg is revert value it,revert entire entire value to default value beffore fund function is called
      // for example
      funders.push(msg.sender);
      addressToAmoundFunded[msg.sender]=msg.value;
      number=5;
// if fund function failes number value become 0 and send remaining gas
//require(getConversionRate(msg.value)>=minimumUsd,"Didnt send enough");

    }
    //msg.
   function getPrice()public view returns(uint256){
    //implementing abstract methods of the interface
    AggregatorV3Interface priceFeed=AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
   (,int256 price,,,)= priceFeed.latestRoundData();
   return uint256(price *1e18);//
   
   }
    function getVersion() public view returns(uint256){
      //interatcing with another contract
      //0x694AA1769357215DE4FAC081bf1f309aDC325306 sepolia etherium


AggregatorV3Interface priceFeed=AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        return priceFeed.version(); 
    }

   function getConversionRate(uint256 ethAmount)public view returns(uint256){
    uint256 ethPrice=getPrice();
    uint256 ethAmountInUsd =(ethPrice *ethAmount)/1e18;
    return ethAmountInUsd;
   }

}
//above maths calculations are done because it is appended with use less zero and no decimal point and function used are interface