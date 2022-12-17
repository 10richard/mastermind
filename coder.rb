require './display.rb'
require './breaker.rb'

class Coder < Breaker
    include Display

    @@valid_nums = ['1', '2', '3', '4', '5', '6']

    def initialize
        @game_over = false
        @got_code = false
        @code = get_code
        @mode = 'coder'
        @attempts_left = 12
        @count = 1
        @guess = []
        @hints = []
        @saved_nums = []
    end

    def get_code
        puts instructions('coder_directions')
        until @got_code
            code = gets.chomp.to_s
            validate_code(code)
        end
        return code.split('')
    end

    def validate_code(code)
        if code.length != 4
            if code.length > 4
                puts error_messages('less_nums')
                return
            else
                puts error_messages('more_nums')
                return
            end
        end

        code = code.split('')
        code.each do |char|
            if @@valid_nums.include?(char)
                next
            else
                puts error_messages('not_nums')
                return
            end
        end
            @got_code = true
    end

    def play
        until @game_over
            @guess = generate_guess
            check_guess
            puts
            puts confirm_code('computer', @guess, @hints)
            puts
            check_game_over
        end
    end

    def generate_guess
        guess = ''
        if @hints.empty?
            while guess.length != 4
                guess += @count.to_s
            end
            @count += 1
        else

        end
        @attempts_left -= 1
        return guess.split('')
    end

    def check_hints

    end

    def check_game_over
        if @guess == @code
            @game_over = true
            puts display_lose('coder')
        elsif @attempts_left <= 0
            @game_over = true
            puts display_win('coder')
        end
    end
end