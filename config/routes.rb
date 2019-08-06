Rails.application.routes.draw do
  get 'homes/index'
  get 'homes/call'
  get 'homes/misae'
  root 'homes#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
