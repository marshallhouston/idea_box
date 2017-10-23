Rails.application.routes.draw do
  root to: 'welcome#index'

  resources :users do
    resources :ideas
  end
end
