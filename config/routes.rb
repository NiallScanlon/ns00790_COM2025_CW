Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'



  resources :barbers
  resources :bookings
  resources :contacts, only: [:new, :create]

  root 'welcome#index'

  get '/home', to: 'home#index'
  get '/contact', to: 'contacts#new'
  get '/bookings', to:'bookings#bookings'
  get '/our-team', to: 'barbers#index'
  get '/signout', to: 'clearance/sessions#destroy'
  get 'welcome/index'

  match '/bookings/new', to: 'bookings#new', via: :post

end
