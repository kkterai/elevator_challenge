# Elevator Controller Design

## Introduction
The task: Create a controller algorithm which directs a visitor of a 100-story office building to an elevator based upon the person's current floor and target floor. In thinking about this problem, I quickly came to realize that the job would best be accomplished with an Object Oriented approach. The solution presented includes the following classes:

## Elevator
#### Attributes
* Bank: Integer
* Going Up: Boolean
* Going Down: Boolean
* Serving Floor: Floor object
* Assigned Floors: [] (Sorted, contains next location. If array is empty, it’s idle)
- Note: No more than 10 stops in queue at a time for service quality

## Floor
#### Attributes
* Number: Integer

## Controller
#### Attributes
* Target Floor
* Current Floor
* Best Elevator

## Relationships
* Elevator has_many Floors
* Controller belongs_to Floor

Seeing that the problem's conditionals were quickly becoming complex and not easily scalable, after a search, I realized that State Design Pattern would be more intuitive to scale. Below is a preliminary diagram of how the program could be restructured.

<a href="https://imgur.com/W9WD1aP"><img src="https://i.imgur.com/W9WD1aP.png" title="source: imgur.com" /></a>




