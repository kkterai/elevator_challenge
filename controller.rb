class Controller

    attr_accessor :floor, :target_floor, :best_elevator

    def initialize(floor, target_floor)
        @floor = floor
        @target_floor = target_floor
    end

    def find_elevator
        set_best_elevator
        ele.assigned_floors << self.floor # Add floor to elevator's assigned floors
        show_elevator(@best_elevator)
    end

    def set_best_elevator
        best_elevator_diff = (self.floor - self.target_floor).abs # Establish worst case elevator distance from current location
        Elevator.all.each do |ele|
            if elevator_on_current_floor?(ele, self)
                @best_elevator = ele

            elsif ele.assigned_floors.count < 10 # To ensure consistent service, constrain elevators to a maximum of 10 stops.

                if elevator_serves_current_floor?(ele)
                    if target_floor_en_route_up?(self, ele) && closest_to_user(self, ele, best_elevator_diff)
                        best_elevator_diff = (self.floor - ele.current_location).abs # Reset best diff with better value
                        @best_elevator = ele 
    
                    elsif  elevator_en_route_down?(self, ele) && closest_to_user(self, ele, best_elevator_diff)
                        best_elevator_diff = (self.floor - ele.current_location).abs # Reset best diff with better value
                        @best_elevator = ele       
                    end
                end
            end
        end
    end

    # Utility methods

    def elevator_on_current_floor?(elevator, controller)
        elevator.current_location == controller.floor
    end
    
    def elevator_serves_current_floor?(elevator)
        @target_floor >= Elevator::FLOORS_SERVED[elevator.bank][low] && @target_floor <= Elevator::FLOORS_SERVED[elevator.bank][high]
    end

    def target_floor_en_route_up?(controller, elevator)
        controller.floor < controller.target_floor && elevator.current_location < controller.floor && elevator.going_up
    end

    def target_floor_en_route_down?(controller, elevator)
        controller.floor > controller.target_floor && ele.current.location > controller.floor && elevator.going_down
    end

    def closest_to_user(controller, elevator, best_distance)
        (controller.floor - elevator.current_location).abs < best_distance
    end

    def show_elevator(elevator)
        puts "Go to Elevator number #{elevator.number}"
        self.archive_trip
    end

    def archive_trip
        # archive tasks to implement record keeping
    end
end