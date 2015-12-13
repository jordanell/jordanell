require 'rails_helper'

describe 'layouts/application.html.erb' do
  it 'should render' do
    expect{ render }.not_to raise_error
  end

  it 'should render favicons' do
    render

    rendered.should render_template(partial: 'common/_favicons')
  end

  it 'should render header' do
    render

    rendered.should render_template(partial: 'common/_header')
  end

  it 'should render footer' do
    render

    rendered.should render_template(partial: 'common/_footer')
  end
end
