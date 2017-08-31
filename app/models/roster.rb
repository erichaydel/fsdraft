class Roster < ActiveRecord::Base
    belongs_to :fantasy_team
    has_many :roster_spots

    def add_player(player)
        next_spot = find_next_roster_spot(player.position)
        if next_spot
            return next_spot.update(player_id: player.id)
        end
        return "No spots available"
    end

    def to_h
        {sport: sport,
         roster: roster_spots.map(&:to_h) }
    end

    private

    def find_next_roster_spot(position)
        roster_spots.each do |spot|
            if spot.position & position != [] and !spot.player
                return spot
            end
        end
        return nil
    end

end
