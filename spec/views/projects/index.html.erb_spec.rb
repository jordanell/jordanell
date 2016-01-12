require 'rails_helper'

describe 'projects/index.html.erb' do
  it 'should render' do
    expect{ render }.not_to raise_error
  end

  it 'should render projects' do
    @projects = [FactoryGirl.create(:project)]

    render

    rendered.should render_template(partial: 'projects/_list_item')
  end

  it 'should render no projects message' do
    @projects = []

    render

    rendered.should have_content('I have not uploaded any projects yet! Check back soon.')
  end
end
