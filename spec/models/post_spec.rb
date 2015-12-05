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

require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryGirl.create(:post)
  end

  subject{ @post }

  # Attributes
  it { should respond_to(:id) }
  it { should respond_to(:created_at) }
  it { should respond_to(:updated_at) }
  it { should respond_to(:title) }
  it { should respond_to(:body) }
  it { should respond_to(:visible) }
  it { should respond_to(:featured) }
  it { should respond_to(:hero_image_file_name) }
  it { should respond_to(:hero_image_content_type) }
  it { should respond_to(:hero_image_file_size) }
  it { should respond_to(:hero_image_updated_at) }

  # Attachments
  it { should respond_to(:hero_image) }

  # Validations
  it 'should have a title' do
    @post.title = nil

    @post.should_not be_valid
  end

  it 'should not allow blank title' do
    @post.title = ''

    @post.should_not be_valid
  end

  it 'should not allow title longer than 150 characters' do
    @post.title = 'a' * 151

    @post.should_not be_valid
  end

  it 'should have a slug' do
    @post.slug = nil

    @post.should_not be_valid
  end

  it 'should not allow a blank slug' do
    @post.slug = ''

    @post.should_not be_valid
  end

  it 'should have a unique slug' do
    @post2 = FactoryGirl.create(:post, slug: 'Test')
    @post.slug = 'Test'

    @post.should_not be_valid
  end

  it 'should not allow slug longer than 75 characters' do
    @post.slug = 'a' * 76

    @post.should_not be_valid
  end

  it 'should not allow nil featured' do
    @post.featured = nil

    @post.should_not be_valid
  end

  it 'should not allow featured when not visible' do
    @post.featured = true
    @post.visible = false

    @post.should_not be_valid
  end

  it 'should not allow nil visible' do
    @post.visible = nil

    @post.should_not be_valid
  end

  it 'should have a hero image' do
    @post.hero_image = nil

    @post.should_not be_valid
  end

  it 'should allow hero image jpg' do
    @post.hero_image_content_type = 'image/jpg'

    @post.should be_valid
  end

  it 'should allow hero image jpeg' do
    @post.hero_image_content_type = 'image/jpeg'

    @post.should be_valid
  end

  it 'should allow hero image gif' do
    @post.hero_image_content_type = 'image/gif'

    @post.should be_valid
  end

  it 'should allow hero image png' do
    @post.hero_image_content_type = 'image/png'

    @post.should be_valid
  end

  it 'should not allow hero image larger than 5 megabytes' do
    @post.hero_image_file_size = (5.megabytes + 1)

    @post.should_not be_valid
  end
end
