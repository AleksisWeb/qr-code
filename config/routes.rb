Rails.application.routes.draw do
  default_url_options host: "https://super-qrcode.herokuapp.com/"
  root 'qr_codes#new'
  get '/contacts', to: 'pages#contact', as: :contact
  get '/qr_codes', to:  'qr_codes#qr_code', as: :qr_codes 
  
  post '/qr_codes', to: 'qr_codes#create'
  get  '/qr_codes/:id/edit', to: 'qr_codes#edit', as: :edit_qr_code
  patch '/qr_codes/:id', to: 'qr_codes#update', as: :qr_code
  delete '/qr_codes/:id', to: 'qr_codes#destroy'
  
  get '/qr_codes/:id', to: 'qr_codes#show'
  
  get '/users/new' , to:  'users#new' , as: :new_user
  post '/users' , to: 'users#create' , as: :users
  
   get '/login', to: 'sessions#new', as: :login
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: :logout
  #For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
