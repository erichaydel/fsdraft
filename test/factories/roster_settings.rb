# == Schema Information
#
# Table name: roster_settings
#
#  id         :integer          not null, primary key
#  definition :text             default({:NFL=>[], :NHL=>[], :NBA=>[], :MLB=>[]})
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :roster_setting do
    definition "MyText"
  end
end
