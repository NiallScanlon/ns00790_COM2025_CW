Rails.application.routes.draw do

  resources :barbers
  resources :bookings
  resources :contacts, only: [:new, :create]

  get '/home', to:'home#index'
  root 'home#index'


  get '/contact', to: 'contacts#new'
  get '/bookings', to:'bookings#bookings'
  get '/our-team', to: 'barbers#index'

  match '/bookings/new', to: 'bookings#new', via: :post

end
