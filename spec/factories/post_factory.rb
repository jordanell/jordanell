# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  body       :text
#  created_at :datetime
#  updated_at :datetime
#  featured   :boolean          default(FALSE)
#  visible    :boolean          default(FALSE)
#  slug       :string           not null
#

FactoryGirl.define do
  factory :post do
    title { "Post #{SecureRandom.uuid[0..10]}" }
    slug { SecureRandom.uuid }
    body 'Post body'
    visible true
  end
end
