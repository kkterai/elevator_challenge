# Elevator Controller Design (WIP)

## Task
Create a controller algorithm which tells the user which elevator to use

## Relationships
Elevator has_many Floors
Controller belongs_to Floor
Note/Question: Can a number suffice for the f?

## States of the Elevator
Bank: 1, 2, or 3 corresponding to a hash of high and low values
Going Up: Boolean
Going Down: Boolean
Serving Floor: Floor number
Assigned Floors: [] (Sorted, contains next location - if array is empty, it’s idle)
Note: No more than 10 stops in queue at a time

## States of the Floor
Location: Integer

## States of the Controller
Target Floor
Current Floor

Possible Type of Solution: State Machine


