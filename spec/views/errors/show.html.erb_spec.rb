require 'rails_helper'

describe 'errors/show.html.erb' do
  it 'should display the error message' do
    render

    rendered.should have_content('Uh no, something caused an')
    rendered.should have_content('Error')
    rendered.should have_content('Please make sure you are visiting the correct page, or try again.')
  end

  it 'should display apology' do
    render

    rendered.should have_content('Whoops!')
  end

  it 'should display the error code' do
    @status_code = '404'

    render

    rendered.should have_content('404')
  end

  it 'should display the action text' do
    render

    rendered.should have_content('Please make sure you are visiting the correct page, or try again.')
  end
end
