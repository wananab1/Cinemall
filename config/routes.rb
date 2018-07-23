Rails.application.routes.draw do


  	namespace :admins do
      get '/top' => 'top#top'
      resources :users, only: [:index]
      resources :lists, except: [:show] do
        resources :list_items, only: [:new, :create, :destroy]
      end
   		resources :movies, except: [:show] do
        resources :casts, only: [:new, :create, :destroy]
      end
  	end

    resources :lists, only: [:show, :index]
    resources :genres, only: [:show]
    resources :countries, only: [:show]
  	resources :movies, only: [:show] do
      resources :reviews, only: [:create, :update, :destroy]
      resource :clips, only: [:destroy, :create]
      post '/us_clips' => 'clips#us_create'
      delete '/us_clips' => 'clips#us_destroy'
    end
    resources :reviews, only: [:show] do
      resource :likes, only: [:destroy, :create]
    end



    devise_for :admins
    devise_for :users

    resources :users, only: [:show, :edit, :update] do
      resources :clips, only: [:index]
    end

    get '/search' => 'top#search'
   	get '' => 'top#top', as: :top
end
