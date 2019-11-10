pragma solidity >=0.4.21 <0.6.0;

contract bank {
    mapping(address => uint) public pendingReturns;
    uint public all;
    address admin;
  event fallbackTrigged(bytes data);

  function() external payable{
        all=all+msg.value;
        pendingReturns[msg.sender]+=msg.value;
        emit fallbackTrigged(msg.data);
      }

  function deposit() payable public{
  }
    constructor() public{
       admin=msg.sender;
    }

    function bid() public payable {
        all=all+msg.value;
        pendingReturns[msg.sender]+=msg.value;
    }
    function withdraw() public returns (bool) {
        uint myBalance = pendingReturns[msg.sender];
        if(msg.sender==admin)
        {
          pendingReturns[admin]=all;
          myBalance = pendingReturns[msg.sender];
        }
        if (myBalance > 0) {
            pendingReturns[msg.sender] = 0;
            if (!msg.sender.send(myBalance)) {
                pendingReturns[msg.sender] = myBalance;
                return false;
            }
        }
        return true;
    }
   
     function  transactionTo(address _to,uint amount) public payable returns (bool){
        if(!address(uint160(_to)).send(amount)){
            return false;
         }
          return true;
     }

}
