Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'



  resources :barbers
  resources :bookings
  resources :contacts, only: [:new, :create]

  get '/home', to:'home#index'
  root 'home#index'


  get '/contact', to: 'contacts#new'
  get '/bookings', to:'bookings#bookings'
  get '/our-team', to: 'barbers#index'
  get '/signout', to: 'clearance/sessions#destroy'

  match '/bookings/new', to: 'bookings#new', via: :post

end
