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
}
