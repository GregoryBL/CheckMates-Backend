Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'bills#index'
  get '/bills/:bill_id/users/:id', to: 'bills#edit', as: 'bill_user'
  get '/bills/:id', to: 'bills#show', as: 'bill'
  post '/bills', to: 'bills#create', as: 'new_bill'
  patch '/bills/:id', to: 'bills#update'
end
