Rails.application.routes.draw do

  root to:  'homes#top'
  get '/about' => 'homes#about'

  devise_for :admins

  namespace :admins do
    resources :customers, only: [:show, :index, :edit, :update, :destroy]
    delete 'cuisines/:id' => 'cuisines#destroy', as: 'cuisine'
    resources :genres, only: [:show, :index, :edit, :update, :destroy]
  end

  devise_for :customers

  scope module: :public do
    resources :customers, only: [:show, :edit, :update]
    get 'confirm/:id' => 'customers#confirm', as: 'destroy_confirm'
    patch 'withdraw/:id' => 'customers#withdraw', as: 'withdraw_customer'
    resources :cuisines, only: [:new, :show, :create, :index, :edit, :update, :destroy] do
      resource :cuisine_favorites, only: [:create, :destroy]
      resources :cuisine_comments, only: [:create, :destroy] #もしかしたらできないかも
    end
  end


end
