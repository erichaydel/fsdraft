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

require 'test_helper'

class RosterTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
