Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :echo, only: [:index]
  get 'debug', to: 'echo#debug'
end
