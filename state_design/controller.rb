# Context Class
class Controller

    attr_accessor :state 
    private :state

    def initialize(state)
        @state = state
    end
end