class Controller
    # Attributes
    attr_accessor: :floor, :target_floor, :best_elevator

    def initialize(floor, target_floor)
        @floor = floor
        @target_floor = target_floor
    end

    def check_for_elevator
        Elevator.all.each do |ele|
            # 1) Check if an elevator is on that floor
            if ele.current_location == self.floor
                @best_elevator = ele
             # To ensure consistent service, constrain elevators to a maximum of 10 stops. So when it checks an elevator, it checks whether the elevator has met its max number of stops.
            elsif ele.assigned_floors.count < 10 
                elevator_diff = (self.floor - self.target_floor).abs
            # 2) If no, check if the elevator's bank serves the desired floor and
                if @target_floor >= Elevator::FLOORS_SERVED[ele.bank][low] && @target_floor <= Elevator::FLOORS_SERVED[ele.bank][high]
            # 3) Check whether the user wants to go to an upper floor, the elevator's current location is lower, it's going up, and it's nearest to the controller floor... 
                    if self.floor < self.target_floor && ele.current_location < self.floor && ele.going_up && (self.floor - ele.current_location).abs < elevator_diff
                        @best_elevator = ele 
                #...or lower floor from their current floor, the elevator's current location is higher, it's going down, and it's nearest to the controller floor
                    elsif self.floor > self.target_floor && ele.current.location > self.floor && ele.going_down && (self.floor - ele.current_location).abs < elevator_diff
                        @best_elevator = ele       
            # 4) Assign the elevator as best elevator
        end
        ele.assigned_floors << self.floor # Add floor to elevator's assigned floors
        self.floor.
        show_elevator(@best_elevator)
    end

    def show_elevator(elevator)
        puts "Go to Elevator number #{elevator.number}"
        self.archive_trip
    end

    def archive_trip
        # archive tasks to implement record keeping
    end
end