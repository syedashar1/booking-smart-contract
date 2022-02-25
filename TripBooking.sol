pragma solidity ^0.6.0 ;

contract TripBooking{

    int public tickets ;
    address payable public  owner ;
    mapping( address => TripStruct ) public trips;
    mapping( int => TripStructB ) public soldTickets;
    mapping( address => int ) public ticketPossession ;

    struct TripStruct{
        int ticketNumber;
        address _personAccount ; 
        string _name;
        uint8 _age;
    }
    struct TripStructB{
        int ticketNumber;
        address _personAccount ; 
        string _name;
        uint8 _age;
    }


    enum StateA {Waiting , Ready , Active}
    enum StateB {Waiting , Ready , Active}
    enum StateC {Waiting , Ready , Active}
    StateA public stateA;
    StateB public stateB;
    StateC public stateC;

    event Transfer(address indexed from, address indexed to, uint256 value);

    constructor() public { 
        tickets = 100;
        owner = msg.sender ;
        ticketPossession[msg.sender] = 100;
        stateA = StateA.Waiting; 
        stateB = StateB.Waiting; 
        stateC = StateC.Waiting; 
    }

    modifier onlyOwner(){
        require(owner == msg.sender , "Only Owner can perform this action");
        _;
    }
    
    modifier notOwner(){
        require(owner != msg.sender , "Owner can NOT perform this action");
        _;
    }

    function ActivateA() public onlyOwner{ stateA = StateA.Active; }
    function ActivateB() public onlyOwner{ stateB = StateB.Active; }
    function ActivateC() public onlyOwner{ stateC = StateC.Active; }

    function DecativateA() public onlyOwner{ stateA = StateA.Waiting; }
    function DecativateB() public onlyOwner{ stateB = StateB.Waiting; }
    function DecativateC() public onlyOwner{ stateC = StateC.Waiting; }


    function buyTicketA(string calldata  _name  , uint8 _age) notOwner payable external  {

        require(msg.value == 2000000000000000000 , "Not the required price to buy a ticket" );
        require(msg.sender != address(0) , "Improper Address" );
        require( ticketPossession[owner] > 0 , "All tickets sold out." );
        require(stateA == StateA.Active , "This trip is not active" );
        require(block.timestamp > 1645691206 , "Trip Comming soon.");
        
        if(ticketPossession[msg.sender] > 0 && ticketPossession[msg.sender] < 99 ){
            ticketPossession[msg.sender] += 1 ;
        }
        else{
            ticketPossession[msg.sender] = 1;
        }
        ticketPossession[owner] -= 1; 
        owner.transfer(msg.value);
        trips[msg.sender] = TripStruct(tickets, msg.sender , _name , _age );
        trips[msg.sender] = TripStruct(tickets, msg.sender , _name , _age );
        tickets -= 1 ;
        emit Transfer(msg.sender, owner, msg.value);

    }

    function buyTicketB(string calldata  _name  , uint8 _age) notOwner payable external  {

        require(msg.value == 2000000000000000000 , "Not the required price to buy a ticket" );
        require(msg.sender != address(0) , "Improper Address" );
        require( ticketPossession[owner] > 0 , "All tickets sold out." );
        require(stateB == StateB.Active , "This trip is not active" );
        require(block.timestamp > 1645691206 , "Trip Comming soon.");

       if(ticketPossession[msg.sender] > 0 && ticketPossession[msg.sender] < 99 ){
            ticketPossession[msg.sender] += 1 ;
        }
        else{
            ticketPossession[msg.sender] = 1;
        }
        ticketPossession[owner] -= 1; 
        owner.transfer(msg.value);
        trips[msg.sender] = TripStruct(tickets, msg.sender , _name , _age );
        trips[msg.sender] = TripStruct(tickets, msg.sender , _name , _age );
        tickets -= 1 ;
        emit Transfer(msg.sender, owner, msg.value);

    }

    function buyTicketC(string calldata  _name  , uint8 _age) notOwner payable external  {

        require(msg.value == 2000000000000000000 , "Not the required price to buy a ticket" );
        require(msg.sender != address(0) , "Improper Address" );
        require( ticketPossession[owner] > 0 , "All tickets sold out." );
        require(stateC == StateC.Active , "This trip is not active" );
        require(block.timestamp > 1845691206 , "Trip Comming soon.");

        if(ticketPossession[msg.sender] > 0 && ticketPossession[msg.sender] < 99 ){
            ticketPossession[msg.sender] += 1 ;
        }
        else{
            ticketPossession[msg.sender] = 1;
        }
        ticketPossession[owner] -= 1; 
        owner.transfer(msg.value);
        trips[msg.sender] = TripStruct(tickets, msg.sender , _name , _age );
        soldTickets[tickets] = TripStructB(tickets, msg.sender , _name , _age );
        tickets -= 1 ;
        emit Transfer(msg.sender, owner, msg.value);

    }

}