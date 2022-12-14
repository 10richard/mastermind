module Display

    def introduction
        puts
    end

    def error_messages(message)
        {
            mode => "You did not enter 1 or 2.",

        }[message]
    end

    def instructions(message)
        {
            mode => "Enter 1 to play as Coder | Enter 2 to play as Breaker",

        }[message]
    end
end