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
        @count = 0
        @turn_count = 1
        @guess = []
        @display_hints = []
        @hints = []
        @saved_nums = []
        @nums_not_found = true
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
            puts confirm_code('computer', @guess, @display_hints)
            puts
            check_hints
            check_game_over
            @display_hints = []
            @hints = []
            @guess = []
        end
    end

    def generate_guess
        guess = ''
        if @nums_not_found
            while guess.length != 4
                guess += @turn_count.to_s
            end
            @turn_count += 1
        else
            guess = @saved_nums.shuffle
            @attempts_left -= 1
            return guess
        end
        @attempts_left -= 1
        return guess.split('')
    end

    def check_guess
        temp_guess = @guess.dup
        temp_code = @code.dup
        all_nums = temp_code.zip(temp_guess)
        counter = 0

        all_nums.each do |code_num, guess_num|
            if code_num == guess_num
                @display_hints.push(white_circle)
                @hints.push('w')
                temp_guess.delete_at(counter)
                temp_code.delete_at(counter)
                counter -= 1
            end
            counter += 1
        end

        temp_code.each do |num|
            if temp_guess.include?(num)
                @display_hints.push(black_circle)
                @hints.push('b')
            end
        end
    end

    def check_hints
        @count += 1
        if @hints.any?('w')
            if @count > 6
                return
            elsif @saved_nums.length != 4
                @hints.each do |hint|
                    if hint == 'w'
                        @saved_nums.push(@count.to_s)
                    end
                end
            end
        elsif @saved_nums.length == 4
            @nums_not_found = false
        end
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