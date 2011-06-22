Cemu::Application.routes.draw do
  resources :genes

  resources :variation_types

  resources :articles do
    collection do
      get 'found'
      get 'missed'
    end
  end

  root :to => 'pages#home'
  match "/auth/:provider/callback" => "sessions#create"  
  match "/signout" => "sessions#destroy", :as => :signout  
end
