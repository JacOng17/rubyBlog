Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
 
  resources :articles do
    resources :comments # This creates comments as a nested resource within articles.
  end

  root 'welcome#index'
end
