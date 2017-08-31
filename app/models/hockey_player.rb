class HockeyPlayer < Player

    VALID_POSITIONS = ['C', 'RW', 'LW', 'D', 'G']

    def sport
        "NHL"
    end

    def valid_positions
        VALID_POSITIONS
    end

end
