Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root 'root#show'

  StaticController::STATIC_PAGES.each do |page|
    get "/#{page}", to: "static##{page}"
  end

  # Blog posts
  resources :posts, only: [:index, :show]
  get '/blog', to: 'posts#index', as: 'blog'

  # Projects
  resources :projects, only: [:index, :show]
  get '/portfolio', to: 'projects#index', as: 'portfolio'
end
