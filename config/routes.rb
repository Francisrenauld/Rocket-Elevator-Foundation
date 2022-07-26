Rails.application.routes.draw do
  resources :interventions
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  resources :leads
  resources :migrations
  resources :employees
  resources :quotes
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  
  # get 'leads/new'
  
  root 'welcome#index'

  post 'lead' => 'leads#create'

  get "/test" => 'tests#patate'
  # post 'lead' => 'leads#sendgrid'
  

  get 'residential' => 'welcome#residential'

  get 'commercial' => 'welcome#commercial'

  # get '/admin' => 'rails_admin#admin'
  
  get 'quote' => 'welcome#quote'
  post 'quote' => 'quotes#create'

  get 'quote' => 'quotes#new'

  get 'map' => 'googlemaps#map'

  get 'intervention' => 'interventions#new'

  get 'get_buildings_by_customer/:customer_id', to: 'buildings#get_buildings_by_customer'  
  get '/building_search' => 'buildings#building_search'

end

