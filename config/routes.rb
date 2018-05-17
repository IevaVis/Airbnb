Rails.application.routes.draw do
  #get URL => braintree controller#action new, as: braintree_new path
  get 'reservation/:reservation_id/braintree/new' => "braintree#new", as:"braintree_new"
  post 'reservation/:reservation_id/braintree/checkout' => "braintree#checkout", as:"braintree_checkout"

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]
  
  get "/users/reservations" => "users#reservations", as: "users_reservations"

  resources :users, controller: "users" do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  resources :listings do
    resources :reservations
  end

  get "/search" => "search#index" 
  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"

  root "welcome#index"

end

 




