require 'rails_helper'

describe 'projects/show.html.erb' do
  it 'should render' do
    @project = FactoryGirl.create(:project)

    expect{ render }.not_to raise_error
  end

  it 'should render project name' do
    @project = FactoryGirl.create(:project)

    render

    rendered.should have_content(@project.name)
  end

  it 'should render project description' do
    @project = FactoryGirl.create(:project)

    render

    rendered.should have_content(@project.description.html_safe)
  end
end
