Rails.application.routes.draw do
  get 'relationships/followings'
  get 'relationships/followers'
  get 'gear_genres/index'
  get 'gear_genres/edit'
  get 'body_part_genre/index'
  get 'body_part_genre/edit'
  get 'articles/index'
  get 'articles/show'
  get 'articles/edit'
  get 'articles/new'
  devise_for :admins
  devise_for :users

  resources :users do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
