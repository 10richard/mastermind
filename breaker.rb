require './display.rb'

class Breaker
    include Display

    attr_accessor :guess, :attempts_left

    @@valid_nums = ['1', '2', '3', '4', '5', '6']

    def initialize
        @finished = false
        @got_guess = false
        @code = generate_code
        @hints = []
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
                puts
                valid_guess
            end
            check_guess
            confirm_code('confirm_guess', @guess, @hints)
            puts
            check_game_over
            @got_guess = false
            @hints = []
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
                return
            else
                puts error_messages('more_nums')
                return
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
            @attempts_left -= 1
    end

    def check_guess
        temp_guess = @guess.dup
        temp_code = @code.dup
        all_nums = temp_code.zip(temp_guess)
        count = 0

        all_nums.each do |code_num, guess_num|
            if code_num == guess_num
                @hints.push(white_circle)
                temp_guess.delete_at(count)
                temp_code.delete_at(count)
                count -= 1
            end
            count += 1
        end

        temp_code.each do |num|
            if temp_guess.include?(num)
                @hints.push(black_circle)
            end
        end
    end

    def check_game_over
        if @guess == @code
            @finished = true
            puts display_win('breaker')
        elsif @attempts == 0
            @finished = true
            puts display_lose('breaker')
        end
    end
end