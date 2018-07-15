## Specification

### Requirements

* You should be able to interact with your code via a REPL like IRB or the JavaScript console.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see


| date       | credit  | debit  | balance |
| ---        | ---     | ---    | ---     |
| 14/01/2012 |         | 500.00 | 2500.00 |
| 13/01/2012 | 2000.00 |        | 3000.00 |
| 10/01/2012 | 1000.00 |        | 1000.00 |

#### Trello Board :

https://trello.com/b/1ina1rpk/bank-tech-test

#### Use Case Diagram :

<img src="./Bank-tech-test.svg">

| Use Case Name  | Banking tech test |
| --- | --- |
| Summary Description | Allows a bank client to withdraw and deposit money from their bank account |
| Preconditions | The user must have a bank account |
| Post conditions | • On success, the account holder should be able to see a copy of their current bank statement<br>• The items on the bank statement should be in reverse chronological order<br>• The statement should include the account balance |
| Actors          | • Bank Client / Account Holder<br>• Banking System |
| Triggers        | • User opens an account<br>• User deposits money into their account<br>• User withdraws money from their account<br>• User prints bank statement |
| Main flow       |  |