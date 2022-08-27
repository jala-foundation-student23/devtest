Rails.application.routes.draw do
  resources :cats
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  namespace :api do
    namespace :v1 do
      get '/cats', to: 'cats#index'
      get '/cat', to: 'cats#cat'
      get '/cat/:id', to: 'cats#show'
    end
  end
  
  root "cats#index"

  get '/cats/:id/cat',                          to: 'cats#cat'
end
