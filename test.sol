pragma solidity ^0.4.18;

contract Owned {
    address owner;
    
    function Owned() public {
        owner = msg.sender;
    }
    
   modifier onlyOwner {
       require(msg.sender == owner);
       _;
   }
}

contract Courses is Owned {
    
    struct Instructor {
        uint age;
        bytes16 fName;
        bytes16 lName;
        bytes16 fName1;
        bytes16 lName1;
    }
    
    mapping (uint => Instructor) instructors;
    uint[] public instructorAccts;
    uint256 Count = 0;
    
    event instructorInfo(
       bytes16 fName,
       bytes16 lName,
       bytes16 fName1,
       bytes16 lName1,
       uint age
    );
    
    function setInstructor(address _address, uint _age, bytes16 _fName, bytes16 _lName, bytes16 _fName1, bytes16 _lName1) onlyOwner public {
        var instructor = instructors[Count];
        
        instructor.age = _age;
        instructor.fName = _fName;
        instructor.lName = _lName;
        instructor.fName1 = _fName1;
        instructor.lName1 = _lName1;
        
        instructorAccts.push(Count) -1;
        instructorInfo(_fName, _lName,_fName1, _lName1, _age);
        Count++;
    }
    
  
   
     function getInfoAt(uint ID) public view returns (uint,bytes16,bytes16,bytes16,bytes16) {
       
      return(instructors[ID].age, instructors[ID].fName, instructors[ID].lName, instructors[ID].fName1, instructors[ID].lName1);
     
   }
   
    
     function getCowInfoById(uint Id) public view returns (bytes16,bytes16,bytes16,bytes16) { //get last
       uint CowInfoIndex = 0;
       for (uint ci = 0; ci <= Count; ci++) {
           if (instructors[ci].age == Id)
           {
               CowInfoIndex = ci;
              
           }
       }
      return(instructors[CowInfoIndex].fName,instructors[CowInfoIndex].lName,instructors[CowInfoIndex].fName1,instructors[CowInfoIndex].lName1);
     
   }
     function findID(uint Id) public view returns(uint[]) {
        uint counter = 0;
        for (uint i = 0; i < Count; i++) {
            if (instructors[i].age == Id)
           {
              counter++;
              
           }
        }
        uint[] memory v = new uint[](counter);
         uint counter1 = 0;
        for ( i = 0;i < Count; i++) {
           if (instructors[i].age == Id)
           {
                v[counter1] = i;
                counter1++;
            }
        }

        return v;

    }

    function countInstructors() view public returns (uint) {
        return instructorAccts.length;
    }
    
}
