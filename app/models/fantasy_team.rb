class FantasyTeam < ActiveRecord::Base
    has_many :rosters


    SPORTS = ["NFL", "MLB", "NHL", "NBA"]
    after_create :create_teams

    def create_teams
        SPORTS.each do |sport|
            Roster.create(sport: sport, fantasy_team: self)
        end
    end

    def roster(sport)
        rosters.where(sport: sport).first
    end

    def add_player(player)
        return roster(player.sport).add_player(player)
    end

end
