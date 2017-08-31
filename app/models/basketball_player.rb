class BasketballPlayer < Player

    VALID_POSITIONS = ['PG', 'SG', 'SF', 'PF', 'C']

    def sport
        "NBA"
    end

    def valid_positions
        VALID_POSITIONS
    end

end
