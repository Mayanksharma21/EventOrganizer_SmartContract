// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract EventContract{
    struct Event{
        address organizer;
        string name;
        uint date;
        uint price;
        uint ticketCount;
        uint ticketRemain;
    } 

    mapping(uint=>Event) public event_map;
    mapping(address=>mapping(uint=>uint)) public tickets;
    uint ID;

    function createEvent(string memory name, uint date, uint price, uint ticketCount) external{
        require(date > block.timestamp, "You can organize event for future dates.");
        require(ticketCount > 0, "Ticket count must be greater then 0");

        event_map[ID] = Event(msg.sender, name, date, price, ticketCount, ticketCount);
        ID++;
    }

    function buyTicket(uint id, uint quantity) external payable {
        require(event_map[id].date != 0, "Event does not exist.");
        require(event_map[id].date > block.timestamp, "Event has already occured.");
        require(event_map[id].price * quantity <= msg.value, "Ether not enough for this quantity of tickets.");
        Event storage _event = event_map[id];
        require(_event.ticketRemain >= quantity, "Tickets are not enough");
        _event.ticketRemain -= quantity;

        tickets[msg.sender][id] += quantity;
    }

    function transferTicket(uint id, uint quantity, address _toSend) external{
        require(event_map[id].date != 0, "Event does not exist.");
        require(event_map[id].date > block.timestamp, "Event has already occured.");
        require(tickets[msg.sender][id] >= quantity, "Not enough tickets.");
        tickets[msg.sender][id] -= quantity;
        tickets[_toSend][id] += quantity;
    }
}