Rails.application.routes.draw do

  devise_for :users
  root 'pages#index'

   mount ActionCable.server => '/cable'
end
