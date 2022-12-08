// SPDX-License-Identifier: MIT
pragma solidity >=0.4.2 <0.9.0;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract MonsterZone is ERC721 {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenId;

     struct Days {
        uint256 Day1;
        uint256 Day1E;
        uint256 Day2;
        uint256 Day2E;
        uint256 Day3;
        uint256 Day3E;
        uint256 Day4;
        uint256 Day4E;
    }

    Days public D;
    
    
    
    
    
    struct DayOneSlots {
        uint256 slotOne;
        uint256 slotOneE;
        uint256 slotTwo;
        uint256 slotTwoE;
        uint256 slotThree;
        uint256 slotThreeE;
        uint256 slotFour;
        uint256 slotFourE;
    }

    DayOneSlots public s;

     struct DayTwoSlots {
        uint256 slotOne;
        uint256 slotOneE;
        uint256 slotTwo;
        uint256 slotTwoE;
        uint256 slotThree;
        uint256 slotThreeE;
        uint256 slotFour;
        uint256 slotFourE;
    }

    DayTwoSlots public s2;

    struct DayThreeSlots {
        uint256 slotOne;
        uint256 slotOneE;
        uint256 slotTwo;
        uint256 slotTwoE;
        uint256 slotThree;
        uint256 slotThreeE;
        uint256 slotFour;
        uint256 slotFourE;
    }

    DayThreeSlots public s3;

   

    // set The day time for Day one, Day two, Day three and the last Day four for the minting.

    uint256 public DayOne;
    uint256 public DayTwo;

    uint256 public DayThree;
    uint256 public DayFour;

    // `_plots` is mapping that is used to set the plotId, taking it as a key type for the slotId and the number of plots that is used as a value types.
    // `Large` with the plotId of `1`, `Small` with the plotId of `2`and the `Medium` with the plot Id of `3`.

    mapping(string => uint256) public _plots;

    // `slotOne Addresses` we have three days with four slots each. All of the slot contains the same addresses. Setting the address for the slot.
    // `slotTwo Addresses` set the addresses for the slot two.
    //`slotThree Addresses` set the addresses for the slot three

    mapping(address => bool) public addrSlotOne;
    mapping(address => bool) public addrSlotTwo;
    mapping(address => bool) public addrSlotThree;

  
    constructor() ERC721("", "") {}

    /* set slot one of day one,`start` in the starting time of the slot and `end` 
    is the ending time of the slot one. */

    // Bytecode assigns value directly to storage slots

    function setDays(
        uint256 x,
        uint256 xE,
        uint256 x2,
        uint256 x2E,
        uint256 x3,
        uint256 x3E,
        uint256 x4,
        uint256 x4E
    ) public {
        D.Day1 = x;
        D.Day1E = xE;

        D.Day2 = x2;
        D.Day2E = x2E;

        D.Day3 = x3;
        D.Day3E = x3E;

        D.Day4 = x4;
        D.Day4E = x4E;
    }











    function DayOneSlot(
        uint256 x,
        uint256 xE,
        uint256 x2,
        uint256 x2E,
        uint256 x3,
        uint256 x3E,
        uint256 x4,
        uint256 x4E
    ) public {
        s.slotOne = x;
        s.slotOneE = xE;

        s.slotTwo = x2;
        s.slotTwoE = x2E;

        s.slotThree = x3;
        s.slotThreeE = x3E;

        s.slotFour = x4;
        s.slotFourE = x4E;
    }





    function DayTwoSlot(
        uint256 x,
        uint256 xE,
        uint256 x2,
        uint256 x2E,
        uint256 x3,
        uint256 x3E,
        uint256 x4,
        uint256 x4E
    ) public {
        s2.slotOne = x;
        s2.slotOneE = xE;

        s2.slotTwo = x2;
        s2.slotTwoE = x2E;

        s2.slotThree = x3;
        s2.slotThreeE = x3E;

        s2.slotFour = x4;
        s2.slotFourE = x4E;
    }




    function DayThreeSlot(
        uint256 x,
        uint256 xE,
        uint256 x2,
        uint256 x2E,
        uint256 x3,
        uint256 x3E,
        uint256 x4,
        uint256 x4E
    ) public {
        s2.slotOne = x;
        s2.slotOneE = xE;

        s2.slotTwo = x2;
        s2.slotTwoE = x2E;

        s2.slotThree = x3;
        s2.slotThreeE = x3E;

        s2.slotFour = x4;
        s2.slotFourE = x4E;
    }

    function setDayOne(uint256 isTime) public {
        DayOne = isTime;
    }

    function setPlots(string memory isCategory, uint256 arePlots) public {
        _plots[isCategory] = arePlots;
    }

    /*  `setSlotOneAddress`,`setSlotAddTworess` and `setSlotAddThreeAddress` used to set the the whitelisted addresses that are used to set the addresses that are whitelisted.
     */

    function addSlotOne(address[] calldata isAddress) public {
        for (uint256 i = 0; i < isAddress.length; i++) {
            addrSlotOne[isAddress[i]] = true;
        }
    }

    function addSlotTwo(address[] calldata isAddress) public {
        for(uint i =0; i<isAddress.length; i++){
        addrSlotTwo[isAddress[i]] = true;
        }
    }
    function addSlotThree(address[] calldata isAddress) public {
        for(uint i =0; i<isAddress.length; i++){
        addrSlotThree[isAddress[i]] = true;
        }
    }



    function mint(string memory isPlotId, uint256 plots) public {
        if (block.timestamp >=  D.Day1 && block.timestamp <=D.Day1E) {
            require(
                (keccak256(abi.encodePacked((isPlotId))) ==
                    keccak256(abi.encodePacked(("Large")))) ||
                    (keccak256(abi.encodePacked((isPlotId))) ==
                        keccak256(abi.encodePacked(("Condos")))) ||
                    (keccak256(abi.encodePacked((isPlotId))) ==
                        keccak256(abi.encodePacked(("giga")))),
                "Must be `Large` `condos` or `giga`"
            );

                                            if (block.timestamp >= s.slotOne && block.timestamp <= s.slotOneE) {
                                                require(
                                                    addrSlotOne[msg.sender] == true,
                                                    "Must be a valid Address of slot one Addresses"
                                                );
                                                require(_plots[isPlotId] > 0, "Category has been sold");
                                                _tokenId.increment();
                                                uint256 newItemId = _tokenId.current();
                                                _mint(msg.sender, newItemId);
                                                _plots[isPlotId] -= plots;
                                            } 
                                            
                                             else if(block.timestamp >= s.slotTwo && block.timestamp <= s.slotTwoE){
                                             require(addrSlotTwo[msg.sender] == true,"Must be a valid Address of slot Two Addresses"); 
                                             require(_plots[isPlotId] > 0,"Category has been sold");
                                                _tokenId.increment();
                                                uint256 newItemId = _tokenId.current();
                                                     _mint(msg.sender, newItemId);
                                                _plots[isPlotId] -= plots;
                                                }

                                             else if(block.timestamp >= s.slotThree && block.timestamp <= s.slotThreeE){
                                            require(addrSlotThree[msg.sender] == true,"Must be a valid Address of slot Three Addresses"); 
                                            require(_plots[isPlotId] > 0,"Category has been sold");
                                                _tokenId.increment();
                                                uint256 newItemId = _tokenId.current();
                                                     _mint(msg.sender, newItemId);
                                                _plots[isPlotId] -= plots;
                                                 }
                                  
                                            else if(block.timestamp >=s.slotFour && block.timestamp <= s.slotFourE){
                                            require(_plots[isPlotId] > 0,"Category has been sold");
                                                _tokenId.increment();
                                                uint256 newItemId = _tokenId.current();
                                                     _mint(msg.sender, newItemId);
                                                _plots[isPlotId] -= plots;
                                    }
                    
                                    else {
                                        revert("Time For slot one,two,three and four is not started yet!");

                                    }

                                            
                                        }


        else  if (block.timestamp >= D.Day2 && block.timestamp <=D.Day2E) {
                                             require(   (keccak256(abi.encodePacked((isPlotId))) == keccak256(abi.encodePacked(('Large')))) ||
                                                        (keccak256(abi.encodePacked((isPlotId))) == keccak256(abi.encodePacked(('Small')))) ||
                                                        (keccak256(abi.encodePacked((isPlotId))) == keccak256(abi.encodePacked(('Condos')))) ||
                                                        (keccak256(abi.encodePacked((isPlotId))) == keccak256(abi.encodePacked(('giga')))),"Must be `Large` `condos` or `giga`" )    ;

                                            if (block.timestamp >= s2.slotOne && block.timestamp <= s2.slotOneE) {
                                                require(
                                                    addrSlotTwo[msg.sender] == true,
                                                    "Must be a valid Address of slot one Addresses"
                                                );
                                                require(_plots[isPlotId] > 0, "Category has been sold");
                                                _tokenId.increment();
                                                uint256 newItemId = _tokenId.current();
                                                _mint(msg.sender, newItemId);
                                                _plots[isPlotId] -= plots;
                                            } 
                                            
                                             else if(block.timestamp >= s2.slotTwo && block.timestamp <= s2.slotTwoE){
                                             require(addrSlotTwo[msg.sender] == true,"Must be a valid Address of slot Two Addresses"); 
                                             require(_plots[isPlotId] > 0,"Category has been sold");
                                                _tokenId.increment();
                                                uint256 newItemId = _tokenId.current();
                                                     _mint(msg.sender, newItemId);
                                                _plots[isPlotId] -= plots;
                                                }

                                             else if(block.timestamp >= s2.slotThree && block.timestamp <= s2.slotThreeE){
                                            require(addrSlotThree[msg.sender] == true,"Must be a valid Address of slot Three Addresses"); 
                                            require(_plots[isPlotId] > 0,"Category has been sold");
                                                _tokenId.increment();
                                                uint256 newItemId = _tokenId.current();
                                                     _mint(msg.sender, newItemId);
                                                _plots[isPlotId] -= plots;
                                                 }
                                  
                                            else if(block.timestamp >=s2.slotFour && block.timestamp <= s2.slotFourE){
                                            require(_plots[isPlotId] > 0,"Category has been sold");
                                                _tokenId.increment();
                                                uint256 newItemId = _tokenId.current();
                                                     _mint(msg.sender, newItemId);
                                                _plots[isPlotId] -= plots;
                                    }
                    
                                    else {
                                        revert("Time For slot one,two,three and four is not started yet!");

                                    }

                                            
                                        }

        else  if (block.timestamp >=  D.Day3 && block.timestamp <= D.Day3E) {
                    require (( keccak256(abi.encodePacked((isPlotId))) == keccak256(abi.encodePacked(('Large')))) ||
                            (keccak256(abi.encodePacked((isPlotId))) == keccak256(abi.encodePacked(('Small')))) ||
                            (keccak256(abi.encodePacked((isPlotId))) == keccak256(abi.encodePacked(('Medium')))) ||
                            (keccak256(abi.encodePacked((isPlotId))) == keccak256(abi.encodePacked(('Condos')))) ||
                            (keccak256(abi.encodePacked((isPlotId))) == keccak256(abi.encodePacked(('giga')))),"Must be `Large` `condos` or `giga`" )    ;  

                                            if (block.timestamp >= s3.slotOne && block.timestamp <= s3.slotOneE) {
                                                require(
                                                    addrSlotTwo[msg.sender] == true,
                                                    "Must be a valid Address of slot one Addresses"
                                                );
                                                require(_plots[isPlotId] > 0, "Category has been sold");
                                                _tokenId.increment();
                                                uint256 newItemId = _tokenId.current();
                                                _mint(msg.sender, newItemId);
                                                _plots[isPlotId] -= plots;
                                            } 
                                            
                                             else if(block.timestamp >= s3.slotTwo && block.timestamp <= s3.slotTwoE){
                                             require(addrSlotTwo[msg.sender] == true,"Must be a valid Address of slot Two Addresses"); 
                                             require(_plots[isPlotId] > 0,"Category has been sold");
                                                _tokenId.increment();
                                                uint256 newItemId = _tokenId.current();
                                                     _mint(msg.sender, newItemId);
                                                _plots[isPlotId] -= plots;
                                                }

                                             else if(block.timestamp >= s3.slotThree && block.timestamp <= s3.slotThreeE){
                                            require(addrSlotThree[msg.sender] == true,"Must be a valid Address of slot Three Addresses"); 
                                            require(_plots[isPlotId] > 0,"Category has been sold");
                                                _tokenId.increment();
                                                uint256 newItemId = _tokenId.current();
                                                     _mint(msg.sender, newItemId);
                                                _plots[isPlotId] -= plots;
                                                 }
                                  
                                            else if(block.timestamp >=s3.slotFour && block.timestamp <= s3.slotFourE){
                                            require(_plots[isPlotId] > 0,"Category has been sold");
                                                _tokenId.increment();
                                                uint256 newItemId = _tokenId.current();
                                                     _mint(msg.sender, newItemId);
                                                _plots[isPlotId] -= plots;
                                    }
                    
                                    else {
                                        revert("Time For slot one,two,three and four is not started yet!");

                                    }

                                            
                                        } 



            else  if(block.timestamp >= D.Day4 )       
           {           
               require( (keccak256(abi.encodePacked((isPlotId))) == keccak256(abi.encodePacked(('Small')))) ||
                        (keccak256(abi.encodePacked((isPlotId))) == keccak256(abi.encodePacked(('Medium')))) ||
                        (keccak256(abi.encodePacked((isPlotId))) == keccak256(abi.encodePacked(('Large')))) ||
                        (keccak256(abi.encodePacked((isPlotId))) == keccak256(abi.encodePacked(('Condos')))) ||
                        (keccak256(abi.encodePacked((isPlotId))) == keccak256(abi.encodePacked(('giga')))),"Must be `Large` `condos` or `giga`" )    ;     
                                  
                                        require(addrSlotOne[msg.sender] == true || 
                                                addrSlotTwo[msg.sender] == true ||
                                                addrSlotThree[msg.sender] == true,"Must be a valid Address of slot one Addresses"); 
                                        require(_plots[isPlotId] > 0,"Category has been sold");
                                                _tokenId.increment();
                                                uint256 newItemId = _tokenId.current();
                                                     _mint(msg.sender, newItemId);
                                                _plots[isPlotId] -= plots;

           }                               

                                         
            else {
            revert("Minting Time has not started yet!");
        }
    }
}
