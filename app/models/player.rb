class Player < ActiveRecord::Base
    serialize :position
    belongs_to :roster_spot
    validates :firstname, :lastname, :team, presence: true
    validates_uniqueness_of :firstname, scope: [:lastname, :team, :type]

    validate :valid_position

    def valid_position
        return (position & valid_positions) != []
    end

    def valid_positions
        raise "Not implemented"
    end

    def pretty
        return firstname + " " + lastname + ", " + position.join("/") + ", " + team
    end

end
