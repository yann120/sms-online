Rails.application.routes.draw do
  resources :messages
  resources :inbound_sms,           only: [:create]
  get "inbound_sms" => "inbound_sms#create"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
