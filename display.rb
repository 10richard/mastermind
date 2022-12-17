require './colors.rb'

module Display

    def logo
        puts
        puts "#########################"
        puts "# WELCOME TO MASTERMIND #"
        puts "#########################"
    end

    def introduction
        puts 
        puts "Objectives:"
        puts "Coder: create a code consisting of four numbers (the computer will try to crack it)"
        puts "Breaker: the computer will create a code (you will have 12 attempts to break it)"
        puts
        puts "How hints work:"
        puts "#{black_circle} = one of the numbers you entered exists in the code but is not in the right position"
        puts "#{white_circle} = one of the numbers you entered exists in the code and is in the right position"
        puts "If no circles are displayed, then none of the numbers you entered are included in the code"
        puts "Hints do not correlate to the position of the numbers"
        puts
    end

    def black_circle
        " ◉ ".black
    end

    def white_circle
        " ◉ "
    end

    def error_messages(message)
        {
            'mode' => "You did not enter 1 or 2.",
            'more_nums' => "You need to enter at least 4 nums",
            'less_nums' => "You entered too many nums",
            'not_nums' => "You did not enter only integers or/and entered a number higher than 6"
        }[message]
    end

    def instructions(message)
        {
            'mode' => "Enter 1 to play as Coder | Enter 2 to play as Breaker",
            'coder' => "Create an unbreakable code! The computer will try to break it...",
            'coder_directions' => "Create a code consisting of 4 numbers that range from 1-6 (ex. 1234)",
            'breaker' => "Try to break the code! The computer will create it...",
            'breaker_directions' => "Guess 4 numbers ranging from 1-6 (ex. 1234)",
        }[message]
    end

    def display_attempts(attempts)
        "#{attempts} attempt(s) left:"
    end

    def display_mode(mode)
        if mode == 1
            puts "You chose to be a Coder!"
            puts instructions('coder')
        else
            puts "You chose to be a Breaker!"
            puts instructions('breaker')
        end
    end

    def display_win(mode)
        {
            'breaker' => 'You cracked the code! Congratulations!',
            'coder' => 'You won! The computer was not able to solve your code!'
        }[mode]
    end

    def display_lose(mode)
        {
            'breaker' => 'You were not able to crack the code. L mans',
            'coder' => 'The computer cracked your code... smh'
        }[mode]
    end

    def bgcolor_nums(num)
        {
            '1' => '   1   '.bg_red,
            '2' => '   2   '.bg_yellow,
            '3' => '   3   '.bg_magenta,
            '4' => '   4   '.bg_cyan,
            '5' => '   5   '.bg_green,
            '6' => '   6   '.bg_blue
        }[num]
    end

    def display_hints(hints)
        return hints.join('')
    end

    def confirm_code(message, code, hints)
        {
            'player' => "You guessed \n\n#{display_code(code)}  #{display_hints(hints)}\n",
            'computer' => "Computer guessed\n\n#{display_code(code)}  #{display_hints(hints)}\n"
        
        }[message]
    end

    def display_code(lst)
        nums = ''
        lst.each do |num|
            nums += " #{bgcolor_nums(num)} "
        end
        return nums
    end
end