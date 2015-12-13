require 'rails_helper'

describe 'shared/_hero_image.html.erb' do
  it 'should render' do
    expect{ render partial: 'shared/hero_image' }.not_to raise_error
  end

  it 'should render with image_url provided' do
    expect{ render partial: 'shared/hero_image', locals: { image_url: 'abc' } }.not_to raise_error
  end
end
