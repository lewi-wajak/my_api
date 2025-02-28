Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute"
  devise_for :users, controllers: { registrations: 'api/registrations' }

  use_doorkeeper
  resources :volcanos

  get "up" => "rails/health#show", as: :rails_health_check

  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end


  root "volcanos#index"
end
