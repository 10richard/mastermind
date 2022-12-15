require './display.rb'

class Breaker
    include Display

    attr_accessor :guess, :attempts_left

    def initialize
        @finished = false
        @code = generate_code
        @guess = []
        @attempts_left = 12
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
        until @finished
            puts instructions('breaker_directions')
            puts display_attempts(@attempts_left)
            while @guess.length < 4
                @guess.push(get_guess)
            end
            check_guess(@guess)
            @finished = true
        end
    end

    def get_guess

    end

    def check_guess

    end
end