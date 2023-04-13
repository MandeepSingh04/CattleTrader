// SPDX-License-Identifier: RANDOM_TEXT


pragma solidity ^0.8.4;
contract CattleTrader{
     uint userID = 0;
    uint cowID = 0;
    uint medID = 0;
    uint dairyID = 0;

    // medical history
    struct Medical{
        string problem;
        string report;
    }

    // dairy
    struct Dairy{
        uint fat;
        uint maxMilk;
    }

    // defination of cows
    struct Cow{
        uint owner; 
        string breed;
        uint dateOfBirth;
        uint price;
        uint[] tests;
        uint[] dtests;
    }

    // owner of the cows
    struct User{
        string name;
        uint[] cows;
        string add;
        uint dob;
        uint minAge;
        uint maxAge;
        uint price;
    }
    mapping(uint=>User) users;
    mapping(uint=>Cow) cows;
    mapping(uint=>Medical) medTests;
    mapping(uint=>Dairy) milkTests;




    uint[] public sell;


    function adduser(string memory _name, string memory user_address, uint _dob) public{
        require(_dob < block.timestamp, "Invalid Date of Birth");
        users[userID] = User({name : _name, cows : new uint[](0), add: user_address, dob :_dob, minAge : 0, maxAge : 0, price : 0});
        userID++;
    }
    
    function addCow(string memory _breed, uint _dob, uint _price, uint _owner) public{
        require(_dob < block.timestamp, "Invalid Date of Birth");
        cows[cowID] = Cow({owner: _owner, breed : _breed, dateOfBirth :_dob, price : _price, tests : new uint[](0), dtests : new uint[](0)});
        cowID++;
        users[_owner].cows.push(cowID);
    }


    function medicalTest(uint _cowID, string memory prob, string memory sol) public{
        medTests[medID] = Medical(prob,sol);
        cows[_cowID].tests.push(medID);
        medID++;
    }


    function updateDairy(uint _cowID, uint _fat, uint _maxMilk) public{
        milkTests[dairyID] = Dairy(_fat,_maxMilk);
        cows[_cowID].dtests.push(dairyID);
        dairyID++;
    }


    function toSell(uint _cowID) public{
        sell.push(_cowID);
    }

    
}
