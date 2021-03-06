# == Schema Information
#
# Table name: projects
#
#  id                      :integer          not null, primary key
#  name                    :string           not null
#  description             :text
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

RSpec.describe Project, type: :model do
  before do
    @project = FactoryGirl.create(:project)
  end

  subject{ @project }

  # Attributes
  it { should respond_to(:id) }
  it { should respond_to(:created_at) }
  it { should respond_to(:updated_at) }
  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:visible) }
  it { should respond_to(:featured) }
  it { should respond_to(:hero_image_file_name) }
  it { should respond_to(:hero_image_content_type) }
  it { should respond_to(:hero_image_file_size) }
  it { should respond_to(:hero_image_updated_at) }

  # Attachments
  it { should respond_to(:hero_image) }

  # Validations
  it 'should have a name' do
    @project.name = nil

    @project.should_not be_valid
  end

  it 'should not allow blank name' do
    @project.name = ''

    @project.should_not be_valid
  end

  it 'should not allow name longer than 200 characters' do
    @project.name = 'a' * 201

    @project.should_not be_valid
  end

  it 'should have a slug' do
    @project.slug = nil

    @project.should_not be_valid
  end

  it 'should not allow a blank slug' do
    @project.slug = ''

    @project.should_not be_valid
  end

  it 'should have a unique slug' do
    @project2 = FactoryGirl.create(:project, slug: 'Test')
    @project.slug = 'Test'

    @project.should_not be_valid
  end

  it 'should not allow slug longer than 75 characters' do
    @project.slug = 'a' * 76

    @project.should_not be_valid
  end

  it 'should not allow nil featured' do
    @project.featured = nil

    @project.should_not be_valid
  end

  it 'should not allow featured when not visible' do
    @project.featured = true
    @project.visible = false

    @project.should_not be_valid
  end

  it 'should not allow nil visible' do
    @project.visible = nil

    @project.should_not be_valid
  end

  it 'should have a hero image' do
    @project.hero_image = nil

    @project.should_not be_valid
  end

  it 'should allow hero image jpg' do
    @project.hero_image_content_type = 'image/jpg'

    @project.should be_valid
  end

  it 'should allow hero image jpeg' do
    @project.hero_image_content_type = 'image/jpeg'

    @project.should be_valid
  end

  it 'should allow hero image gif' do
    @project.hero_image_content_type = 'image/gif'

    @project.should be_valid
  end

  it 'should allow hero image png' do
    @project.hero_image_content_type = 'image/png'

    @project.should be_valid
  end

  it 'should not allow hero image larger than 5 megabytes' do
    @project.hero_image_file_size = (5.megabytes + 1)

    @project.should_not be_valid
  end
end
