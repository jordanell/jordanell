require 'rails_helper'

describe 'posts/index.html.erb' do
  it 'should render' do
    expect{ render }.not_to raise_error
  end

  it 'should render posts' do
    @posts = [FactoryGirl.create(:post)]

    render

    rendered.should render_template(partial: 'posts/_list_item')
  end

  it 'should render no posts message' do
    @posts = []

    render

    rendered.should have_content('I have not created any posts yet! Check back soon.')
  end
end
