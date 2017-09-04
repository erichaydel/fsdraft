# == Schema Information
#
# Table name: rosters
#
#  id              :integer          not null, primary key
#  fantasy_team_id :integer
#  sport           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Roster < ApplicationRecord
    belongs_to :fantasy_team
    has_many :roster_spots
    after_create :generate_roster_spots

    def add_player(player)
        next_spot = find_next_roster_spot(player.position)
        if next_spot
            next_spot.player = player
            return next_spot.save ? [next_spot, ""] : [false, next_spot.errors]
        end
        return false, "No spos available on the team for this player."
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

    def generate_roster_spots
        settings = RosterSetting.last
        settings.definition[sport.to_sym].each do |position|
            roster_spots.create(position: position.split("/"))
        end
    end

end
