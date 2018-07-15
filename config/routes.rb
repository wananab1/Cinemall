Rails.application.routes.draw do

  	namespace :admins do
   		resources :movies, except: [:show]
  	end
  	resources :movies, only: [:show]
    devise_for :admins
    devise_for :users

    get '/search' => 'top#search'
   	root 'top#top'
end
