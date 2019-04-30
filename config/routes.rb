Rails.application.routes.draw do
  resources :numbers
  get 'home/index'
  resources :messages
  resources :inbound_sms,           only: [:create]
  get "inbound_sms" => "inbound_sms#create"
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
