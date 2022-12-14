module Display

    def logo
        puts
        puts "#########################"
        puts "# WELCOME TO MASTERMIND #"
        puts "#########################"
    end

    def introduction
        puts 
        puts "Hints: Empty circle means that number/color that the breaker put in is apart of the code"
        puts "Colored circle means one of the numbers/colors that the break put is in the correct place"
        puts "Rules are pretty damn complicated. (take your time lol)"
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