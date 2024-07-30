// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract SimpleStorage{
   uint256 favouriteNumber=4;
   //public keyword gives getter function for favourite number
   function store(uint256 _favouriteNumber)public virtual{
       favouriteNumber=_favouriteNumber;
   }//virtual keyword make its overridable
   // to declare a list
   uint256[] listOfFavouriteNumber;
   function retrieve() public view returns(uint256){

      return favouriteNumber;

   }
   //functions are marked with publlic so that after deploying we can call that function and view keyword is used for those fucntions 
   //which doesnt update blockchain ,this method is only retrieving favourite number from block not updating the blockchain,pure function cannot update and read block chains
   //to create own data type we use struct in solidity,to group variables into to one variable we use struct
   struct Person{    
        uint256 favouriteNumber;
        string name;
   }
// to create a variable of this datatype
Person public myFriend =Person(7,"pat");
// to create dynamic array 
Person[] public p;
// to create a static array
Person[1000]  staticp;

//to create mapping between favourite number and person
mapping(uint=>string) public map;

//to add person and favourite number  to a array we use push method
function addPerson(string memory _name,uint _favouriteNumber)public{

 p.push(Person(_favouriteNumber,_name));
     map[_favouriteNumber]=_name;
}
}