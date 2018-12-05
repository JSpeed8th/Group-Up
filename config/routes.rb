Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :events
  resources :invites

  root "welcome#index"
  post "/assign" => "events#assign"
  get "/invites/assign/:evid/:userid/:host/:loc" => "invites#assign", :as => :assign_invite
  get "/locations/assign/:isinvite/:lat/:long/:name" => "locations#assign", :as => :assign_location


end
