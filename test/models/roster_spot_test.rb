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

require 'test_helper'

class RosterSpotTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
