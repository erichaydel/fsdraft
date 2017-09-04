# == Schema Information
#
# Table name: roster_settings
#
#  id         :integer          not null, primary key
#  definition :text             default({:NFL=>[], :NHL=>[], :NBA=>[], :MLB=>[]})
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class RosterSetting < ActiveRecord::Base
    serialize :definition
    before_save :check_keys
    KEYS = [:NHL, :MLB, :NBA, :NFL]

    def self.settings
        RosterSetting.first
    end

    def check_keys
        KEYS.each do |key|
            unless definition.key?(key)
                definition[key] = []
            end
        end
    end

    def total_picks
        KEYS.map { |key| definition[key].size }.reduce(:+) * FantasyTeam.count
    end
end
