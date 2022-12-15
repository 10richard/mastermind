require './display.rb'

class SelectMode
    include Display

    def initialize
        @success = false
        logo
        puts
        introduction
        puts
        puts instructions('mode')
        until @success
            @mode = gets.chomp.to_i
            check_mode(@mode) 
        end
    end

    def check_mode(mode)
        if mode == 1 || mode == 2
            @success = true
            display_mode(mode)
            return
        else
            puts error_messages('mode')
        end
    end

    def get_mode
        return @mode
    end
end