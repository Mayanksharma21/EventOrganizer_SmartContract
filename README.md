# EventContract
This is a Solidity smart contract for managing events and ticket sales on the Ethereum blockchain.

## Overview
The EventContract allows event organizers to create events, set the date, price, and the number of tickets available for the event. Attendees can then purchase tickets for the events and transfer them to others if they can no longer attend.

## Features
- Organizers can create events and specify the name, date, price, and number of tickets available.
- Attendees can purchase tickets for the events using Ether.
- Attendees can transfer their tickets to others if they can no longer attend the event.
- The smart contract ensures that events can only be created for future dates and that the ticket count is greater than 0.
- The smart contract also ensures that tickets can only be purchased for events that have not yet occurred, that the Ether sent is enough for the requested tickets, and       that there are enough tickets available.
## Usage
- To use this smart contract, you can deploy it on the Ethereum blockchain using a compatible development environment or a blockchain-as-a-service platform like Infura.   Once deployed, you can interact with it using a web3-enabled browser or a command-line tool like Remix.
- To create an event, call the createEvent function with the event name, date, price, and the number of tickets available.
- To purchase a ticket, call the buyTicket function with the event ID and the quantity of tickets you want to purchase. You will need to send Ether with your transaction to pay for the tickets.
- To transfer a ticket to someone else, call the transferTicket function with the event ID, the quantity of tickets you want to transfer, and the address of the person you want to transfer the tickets to.
