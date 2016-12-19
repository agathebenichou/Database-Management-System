Rails.application.routes.draw do

  root 'cs320proj#home'
  
  resources :cs320proj
  resources :schools
  resources :multiyearrates
  resources :yearlyrates

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
