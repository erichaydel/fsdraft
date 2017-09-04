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

require 'test_helper'

class FantasyTeamTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
