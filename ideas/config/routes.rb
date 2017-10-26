Rails.application.routes.draw do

  get "/main" => "mains#new"

  get "/main/create" => "mains#create"

  delete "/main/:id", to: "mains#destroy", as: "destroy_session"

  post "/users" => "users#create"
  
  get "/users/:id" => "users#show"

  get "/bright_ideas" => "bright_ideas#index"

  post "/bright_ideas/create" => "bright_ideas#create"

  get "bright_ideas/:id", to: "bright_ideas#show", as: "show_bright_idea"

  post "bright_ideas/destroy" => "bright_ideas#destroy"

  post "/joins" => "joins#create"


  
end
