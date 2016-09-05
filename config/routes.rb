Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/bills/:bill_id/user/:user_id', to: 'bills#show', as: 'bill_user_path'
  post '/bills/:bill_id', to: 'bills#create', as: 'bill_path'
  patch '/bills/:bill_id', to: 'bills#update'
end
