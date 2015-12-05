# == Schema Information
#
# Table name: posts
#
#  id                      :integer          not null, primary key
#  title                   :string           not null
#  body                    :text
#  created_at              :datetime
#  updated_at              :datetime
#  featured                :boolean          default(FALSE)
#  visible                 :boolean          default(FALSE)
#  slug                    :string           not null
#  hero_image_file_name    :string
#  hero_image_content_type :string
#  hero_image_file_size    :integer
#  hero_image_updated_at   :datetime
#

FactoryGirl.define do
  factory :post do
    title { "Post #{SecureRandom.uuid[0..10]}" }
    slug { SecureRandom.urlsafe_base64 }
    body 'Post body'
    visible true
    hero_image_file_name 'test_image.jpg'
    hero_image_content_type 'image/jpg'
    hero_image_file_size 10
    hero_image_updated_at Time.now
  end
end
