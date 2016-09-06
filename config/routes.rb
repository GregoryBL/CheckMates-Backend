Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/bills/:bill_id/users/:id', to: 'bills#show', as: 'bill_user'
  post '/bills', to: 'bills#create', as: 'new_bill'
  patch '/bills/:id', to: 'bills#update', as: 'bill'
end
