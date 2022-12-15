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
        puts
    end

    def black_circle
        "◉".black
    end

    def white_circle
        "◉"
    end

    def error_messages(message)
        {
            'mode' => "You did not enter 1 or 2.",
        }[message]
    end

    def instructions(message)
        {
            'mode' => "Enter 1 to play as Coder | Enter 2 to play as Breaker",
            'coder' => "Create an unbreakable code! The computer will try to break it...",
            'breaker' => "Try to break the code! The computer will create it...",
            'breaker_directions' => "Enter 4 numbers ranging from 1-6 (ex. 1234)",
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

    def display_hints
        
    end

    def display_code(lst)
        nums = ''
        lst.each do |num|
            nums += " #{bgcolor_nums(num)} "
        end
        return nums
    end
end