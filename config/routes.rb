Cemu::Application.routes.draw do
  resources :articles

  root :to => 'pages#home'
  match "/auth/:provider/callback" => "sessions#create"  
  match "/signout" => "sessions#destroy", :as => :signout  
end
