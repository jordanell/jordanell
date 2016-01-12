require 'rails_helper'

describe 'projects/_list_item.html.erb' do
  include TruncateHtmlHelper

  it 'should display the name' do
    @project = FactoryGirl.create(:project)

    render partial: 'projects/list_item', locals: { project: @project }

    rendered.should have_content(@project.name)
  end

  it 'should display the view link' do
    @project = FactoryGirl.create(:project)

    render partial: 'projects/list_item', locals: { project: @project }

    rendered.should have_content('View Project')
  end
end
