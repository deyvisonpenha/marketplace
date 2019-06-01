Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  resources :home , only: [:index]
  #resources :sessions
  resources :user

  get    'login_form', to: 'session#new'
  get    'user_form', to: 'user#new'
  post 'login', to: 'session#create'
  post   'signup'   => 'session#create'
  get   'logout'  => 'session#destroy'

end
