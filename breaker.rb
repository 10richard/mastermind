require './display.rb'

class Breaker
    include Display

    attr_accessor :guess, :attempts_left

    @@valid_nums = ['1', '2', '3', '4', '5', '6']

    def initialize
        @finished = false
        @got_guess = false
        @code = generate_code
        @hints = ''
        @guess = ''
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
            until @got_guess
                @guess = get_guess
                valid_guess
            end
            check_guess(@guess)
            puts display_code(@guess)
        end
    end

    def get_guess
        guess = gets.chomp.to_s
        return guess
    end

    def valid_guess
        if @guess.length != 4
            if @guess.length > 4
                puts error_messages('less_nums')
            else
                puts error_messages('more_nums')
            end
        end

        @guess = @guess.split('')
        @guess.each do |char|
            if @@valid_nums.include?(char)
                next
            else
                puts error_messages('not_nums')
                return
            end
        end
            @got_guess = true
            @finished = true
    end

    def check_guess
    end
end