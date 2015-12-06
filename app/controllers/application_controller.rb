class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Before filters
  before_filter :set_seo_tags

  private

  def set_seo_tags
    set_meta_tags title:        'Jordan Ell',
                  description:  'Full stack developer with a passion for Ruby on Rails.',
                  keywords:     %w[Jordan Ell JordanEll Rails Ruby Portfolio Blog Victoria],
                  og:  {
                    title:        'Jordan Ell',
                    type:         'website',
                    url:          'http://jordanell.com',
                    image:        ActionController::Base.helpers.image_path('favicons/favicon-96x96.png'),
                    description:  'Full stack developer with a passion for Ruby on Rails.'
                  },
                  twitter: {
                    card:         'summary',
                    url:          'http://jordanell.com',
                    title:        'Jordan Ell',
                    image:        ActionController::Base.helpers.image_path('favicons/favicon-96x96.png'),
                    description:  'Full stack developer with a passion for Ruby on Rails.'
                  }
  end

  def render_error(code)
    @status_code = code

    render 'errors/show', status: code
  end
end
