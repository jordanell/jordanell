require 'rails_helper'

describe 'root/show.html.erb' do
  it 'should render' do
    expect{ render }.not_to raise_error
  end

  it 'should render featured projects if present' do
    @featured_projects = [FactoryGirl.create(:project, featured: true)]

    render

    rendered.should render_template(partial: 'projects/_list_item', locals: { project: @featured_projects[0] })
  end

  it 'should render featured post if present' do
    @featured_post = FactoryGirl.create(:post, featured: true)

    render

    rendered.should render_template(partial: 'posts/_list_item', locals: { post: @featured_post })
  end
end
