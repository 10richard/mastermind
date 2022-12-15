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
            'breaker' => "Try to break the code! The computer will create it..."
        }[message]
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
end