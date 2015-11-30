Rails.application.routes.draw do
  root 'root#show'

  StaticController::STATIC_PAGES.each do |page|
    get "/#{page}", to: "static##{page}"
  end
end
