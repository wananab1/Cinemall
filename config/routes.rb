Rails.application.routes.draw do

  	namespace :admins do
   		resources :movies, except: [:show] do
        resources :casts, only: [:new, :create, :destroy]
      end
  	end

  	resources :movies, only: [:show] do
      resources :reviews, only: [:create, :update, :destroy]
    end

    devise_for :admins
    devise_for :users

    get '/search' => 'top#search'
   	root 'top#top'
end
