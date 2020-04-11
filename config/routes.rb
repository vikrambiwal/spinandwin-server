Rails.application.routes.draw do
  resources :articles


  root 'welcome#index'

  post "register" => "user#register"
  get "register" => "user#register"
  post "login" => "authentication#login"

  post "coins" => "coins#add_coins"
  post "get_all_coins" => "coins#get_all_coins"
  post "redeem_coins" => "coins#redeem_coins"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
