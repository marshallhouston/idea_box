Rails.application.routes.draw do
  root to: 'welcome#index'

  namespace :admin do
    resources :categories
  end

  resources :users do
    resources :ideas
  end

  resources :categories, only: [:index, :show]

  controller :sessions do
    get '/login' => :new
    post '/login' => :create
    get '/logout' => :destroy #this is the same as using delete and then having the method: :delete on the actual link
  end
end
