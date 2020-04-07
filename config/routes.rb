Rails.application.routes.draw do

  root to: redirect('public/index.html')

  resources :bookings do 
    get 'resume', on: :collection
  end
  resources :users
  resources :functions
  resources :movies
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
