Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'calculator#index'
  resources :calculator, only: [:index]
  match 'evalute', to: 'calculator#evalute', via: [:post]
end
