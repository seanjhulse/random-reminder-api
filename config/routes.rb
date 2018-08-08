Rails.application.routes.draw do
  resources :jobs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'events#index'

  resources :events
  resources :devices

  post 'authenticate', to: 'authentication#authenticate'

end
