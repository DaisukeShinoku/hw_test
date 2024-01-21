Rails.application.routes.draw do
  resources :messages, except: %i[show]
  root to: 'messages#index'
end
