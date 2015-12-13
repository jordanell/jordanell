require 'rails_helper'

describe 'common/_header.html.erb' do
  it 'should display the correct links' do
    render partial: 'common/header'

    # CircleCI can't handle the inflection in Resumé so don't test it
    ['Home', 'Portfolio', 'About', 'Blog', 'Contact'].each do |link|
      rendered.should have_selector('a', text: link)
    end
  end
end
