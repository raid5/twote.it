TwoteIt::Application.routes.draw do |map|
  
  resources :quotes do
    member do
      get :approve
    end
    collection do
      get :pending
    end
  end
  
  match "/auth/:provider/callback" => "sessions#create"
  match "/signout" => "sessions#destroy", :as => :signout
  
  match "/quotes/tweet", :as => :tweet
  
  root :to => "quotes#random"

end
