Rails.application.routes.draw do

  devise_for :admins
  devise_for :users


  scope module: :public do
    resources :users, only: [:index, :show, :edit, :update] do
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end

    resources :articles, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
      resources :article_comments, only: [:create, :edit, :update, :destroy]
      resource :favorites, only: [:index, :create, :destroy]

    end
    get 'index' => 'favorites#index', as: 'favorite_index'
  end

  namespace :admin do
    resources :body_part_genres, only: [:index, :create, :edit, :update]

    resources :gear_genres, only: [:index, :create, :edit, :update]

    resources :articles,  only: [:destroy]
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
