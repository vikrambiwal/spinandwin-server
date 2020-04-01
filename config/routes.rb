Rails.application.routes.draw do
  resources :articles


  root 'welcome#index'

  post "register" => "user#register"
  get "register" => "user#register"
  post "login" => "authentication#login"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
