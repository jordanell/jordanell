Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'root#show'

  StaticController::STATIC_PAGES.each do |page|
    get "/#{page}", to: "static##{page}"
  end
end
