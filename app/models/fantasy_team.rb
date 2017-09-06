# == Schema Information
#
# Table name: fantasy_teams
#
#  id             :integer          not null, primary key
#  name           :string
#  draft_position :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class FantasyTeam < ApplicationRecord
    has_many :rosters, dependent: :destroy


    SPORTS = ["NFL", "MLB", "NHL", "NBA"]
    after_create :create_teams
    after_create :create_draft_position

    def self.number
        FantasyTeam.count
    end

    def self.team_by_pick(pick)
        round = (pick-1) / FantasyTeam.number
        if round.even?
            team = (pick-1) % FantasyTeam.number
        else
            team = FantasyTeam.number - ((pick-1) % FantasyTeam.number) - 1
        end
        FantasyTeam.where(draft_position: team + 1)[0]
    end

    def create_teams
        SPORTS.each do |sport|
            Roster.create(sport: sport, fantasy_team: self)
        end
    end

    def create_draft_position
        update(draft_position: FantasyTeam.number)
    end

    def roster(sport)
        rosters.where(sport: sport).first
    end

    def add_player(player)
        return roster(player.sport).add_player(player)
    end

end
