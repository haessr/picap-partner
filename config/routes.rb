Rails.application.routes.draw do
  root 'bookings#index'
  get '/cancel_booking/:id', to: "bookings#cancel_booking", as: 'cancel_booking'
  resources :bookings
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
