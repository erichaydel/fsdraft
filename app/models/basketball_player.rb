# == Schema Information
#
# Table name: players
#
#  id            :integer          not null, primary key
#  team          :string
#  firstname     :string
#  lastname      :string
#  position      :text
#  rank          :integer
#  position_rank :integer
#  type          :string
#  roster_id     :integer
#  draft_number  :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class BasketballPlayer < Player

    VALID_POSITIONS = ['PG', 'SG', 'SF', 'PF', 'C']

    def sport
        "NBA"
    end

    def valid_positions
        VALID_POSITIONS
    end

end
