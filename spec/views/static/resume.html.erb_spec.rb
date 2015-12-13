require 'rails_helper'

describe 'static/resume.html.erb' do
  it 'should render' do
    expect{ render }.not_to raise_error
  end
end
