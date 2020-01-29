class Elevator
    
    attr_accessor :bank, :going_up, :going_down, :serving_floor, :assigned_floors, :current_location

    FLOORS_SERVED = {
        1: {low: 1, high: 33}, # Keys are bank numbers, values are hashes of floor service ranges
        2: {low: 34, high: 66},
        3: {low: 67, high: 100}
    }

    def initialize(bank)
        @bank = bank
        @assigned_floors = [] # Cannot have more than 10 Floors at a time.
    end

end