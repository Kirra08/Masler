Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }

  devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  devise_scope :user do
    post 'user/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end


  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    resources :users, only: [:index, :show, :edit, :update] do
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
      get "library" => "relationships#library", as: "library"
      resources :calendars, only: [:index, :create, :destroy]
    end

    resources :articles, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
      resources :article_comments, only: [:create, :edit, :update, :destroy]
      resource :favorites, only: [:create, :destroy]

    end
    get 'index' => 'favorites#index', as: 'favorite_index'
    get 'search' => 'searches#search'
    patch 'user/delete_user', as: 'delete_user'
    get "genre_search" => "searches#genre_search"
  end

  namespace :admin do
    resources :body_part_genres, only: [:index, :create, :edit, :update]

    resources :gear_genres, only: [:index, :create, :edit, :update]

    resources :articles,  only: [:index, :show, :destroy] do
      resources :article_comments, only: [:destroy]
    end
    resources :users, only: [:index, :show]
    patch 'user/delete_user', as: 'delete_user'
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
