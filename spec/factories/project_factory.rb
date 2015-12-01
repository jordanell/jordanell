# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#  featured    :boolean          default(FALSE)
#  visible     :boolean          default(FALSE)
#  slug        :string           not null
#

FactoryGirl.define do
  factory :project do
    name { "Project #{SecureRandom.uuid[0..10]}" }
    slug { SecureRandom.uuid }
    description 'Project description'
    visible true
  end
end
