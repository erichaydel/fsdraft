# == Schema Information
#
# Table name: roster_spots
#
#  id         :integer          not null, primary key
#  position   :text
#  roster_id  :integer
#  player_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class RosterSpot < ActiveRecord::Base
    serialize :position

    belongs_to :roster
    belongs_to :player

    validate :correct_position
    validates_uniqueness_of :player_id, allow_blank: true

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

    def pos
        position.join("/")
    end

    def to_h
        pos = position.join("/")
        if player
            { "#{pos}": player.pretty }
        else
            { "#{pos}": "Empty"}
        end
    end

end
