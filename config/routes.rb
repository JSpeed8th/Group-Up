Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  get "/users/:id" => "users#show"
  resources :users
  resources :events

  root "welcome#index"
  post "/assign" => "events#assign"

end
