require 'rails_helper'

describe 'posts/show.html.erb' do
  it 'should render' do
    @post = FactoryGirl.create(:post)

    expect{ render }.not_to raise_error
  end

  it 'should render post meta' do
    @post = FactoryGirl.create(:post)

    render

    rendered.should render_template(partial: 'posts/_meta')
  end

  it 'should render post title' do
    @post = FactoryGirl.create(:post)

    render

    rendered.should have_content(@post.title)
  end

  it 'should render post body' do
    @post = FactoryGirl.create(:post)

    render

    rendered.should have_content(@post.body.html_safe)
  end
end
