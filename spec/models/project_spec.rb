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

  # Validations
  it 'should have a name' do
    @project.name = nil

    @project.should_not be_valid
  end

  it 'should have a unique slug' do
    @project2 = FactoryGirl.create(:project, slug: 'Test')
    @project.slug = 'Test'

    @project.should_not be_valid
  end
end
