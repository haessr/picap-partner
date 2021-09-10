Rails.application.routes.draw do
  root 'bookings#index'
  get '/cancel_booking/:id', to: "bookings#cancel_booking", as: 'cancel_booking'
  get '/local_records/', to: 'bookings#local_records', as:'local_records'
  resources :bookings
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
