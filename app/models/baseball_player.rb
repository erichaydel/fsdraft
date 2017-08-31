class BaseballPlayer < Player

    VALID_POSITIONS = ['SP', 'RP', '1B', '2B', '3B', 'SS', 'RF', 'LF', 'CF', 'C', 'DH']

    def sport
        "MLB"
    end

    def valid_positions
        VALID_POSITIONS
    end

end
