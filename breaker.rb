require './display.rb'

class Breaker
    include Display

    attr_accessor :guess, :attempts_left

    def initialize
        @code = generate_code
        @guess = []
        @attempts_left = 12
        p @code
    end

    def generate_code
        code = []
        while code.length < 4
            rand_num = (1 + rand(6)).to_s
            code.push(rand_num)
        end
        return code
    end

    def play
        puts display_code(@code)
    end

    def get_guess

    end

    def check_guess

    end
end