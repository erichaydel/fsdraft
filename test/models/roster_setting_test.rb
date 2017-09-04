# == Schema Information
#
# Table name: roster_settings
#
#  id         :integer          not null, primary key
#  definition :text             default({:NFL=>[], :NHL=>[], :NBA=>[], :MLB=>[]})
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class RosterSettingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
