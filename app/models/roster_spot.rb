class RosterSpot < ActiveRecord::Base
    serialize :position

    belongs_to :roster
    belongs_to :player, unique: true

    validate :correct_position

    def correct_position
        if player
            if roster.sport != player.sport
                errors.add(:position, "Player is " + player.sport + "; Roster spot is " + roster.sport)
            end
            if (position & player.position) == []
                errors.add(:position, "is incorrect")
            end
        end
    end

    def to_h
        pos = position.join("/")
        { "#{pos}":player.pretty }
    end

end
