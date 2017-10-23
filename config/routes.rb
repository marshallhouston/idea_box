Rails.application.routes.draw do
  root to: 'welcome#index'

  resources :users do
    resources :ideas
  end

  controller :sessions do
    get '/login' => :new
    post '/login' => :create
    delete '/logout' => :destroy
  end
end
