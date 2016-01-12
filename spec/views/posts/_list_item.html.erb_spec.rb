require 'rails_helper'

describe 'posts/_list_item.html.erb' do
  include TruncateHtmlHelper

  it 'should render meta' do
    @post = FactoryGirl.create(:post)

    render partial: 'posts/list_item', locals: { post: @post }

    rendered.should render_template(partial: 'posts/_meta')
  end

  it 'should display the title' do
    @post = FactoryGirl.create(:post)

    render partial: 'posts/list_item', locals: { post: @post }

    rendered.should have_content(@post.title)
  end

  it 'should display the truncated body' do
    @post = FactoryGirl.create(:post)

    render partial: 'posts/list_item', locals: { post: @post }

    rendered.should have_content(truncate_html(@post.body, length: 500))
  end

  it 'should display the read link' do
    @post = FactoryGirl.create(:post)

    render partial: 'posts/list_item', locals: { post: @post }

    rendered.should have_content('Read Post')
  end
end
