class FootballPlayer < Player

    VALID_POSITIONS = ['QB', 'WR', 'RB', 'TE', 'DST', 'K']

    def sport
        "NFL"
    end

    def valid_positions
        VALID_POSITIONS
    end

end
