Rails.application.routes.draw do

  resources :users do
    resources :ideas
  end
end
