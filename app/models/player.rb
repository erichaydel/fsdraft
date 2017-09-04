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

    def pretty_html
        return "<span>"+firstname+"</span><span class='lastname'>"+lastname+"</span>"+
                "<div class='position'>"+position.join("/")+
                "</div><div>"+team+"</div>"
    end

    def id_sanitize(str)
        str.gsub(/\./, "").gsub(/'/, "").gsub(/\s/, "")
    end

    def html_id
        return id_sanitize(firstname)+"-"+id_sanitize(lastname)+"-"+id_sanitize(team)
    end

end
