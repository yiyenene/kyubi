Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :home, only: %i[index index2]
  resources :top, only: %i[index]
end
