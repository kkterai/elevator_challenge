# Elevator Controller Design

## Task
Create a controller that will tell the elevator which floor to go to

## Relationships
Elevator has_many Floors through Controller
Floor has_many Elevators through Controller
Controller belongs_to Floor

## States of the Elevator
Bank: 1, 2, or 3 corresponding to a hash of high and low values
Going Up: Boolean
Going Down: Boolean
Serving Floor: Current Floor
Assigned Floor: [] (Sorted, contains next location - if array is empty, it’s idle)
Note: No more than 10 stops in queue at a time

## States of the Floor
Location: Integer
RequestUp: Boolean
PendingUp: Assigned Elevator or nil
RequestDown: Boolean
PendingDown: Assigned Elevator or nil

## States of the Controller
Target Floor
Current Floor

Possible Type of Solution: State Machine


