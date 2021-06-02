Rails.application.routes.draw do
  root to: 'homes#top'
  get '/about' => 'homes#about'

  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }
  namespace :admins do
    resources :customers, only: %i[show index edit update destroy]
    resources :cuisines, only: %i[index show destroy]
    resources :genres, only: %i[index create edit update destroy]
    resources :contacts, only: %i[show index update]
  end

  devise_for :customers, skip: :all
  devise_scope :customer do
    get 'customers/sign_in' => 'customers/sessions#new', as: 'new_customer_session'
    post 'customers/sign_in' => 'customers/sessions#create', as: 'customer_session'
    get 'customers/sign_out' => 'customers/sessions#destroy', as: 'destroy_customer_session'
    get 'customers/sign_up' => 'customers/registrations#new', as: 'new_customer_registration'
    post 'customers' => 'customers/registrations#create', as: 'customer_registration'
    get 'customers/password/new' => 'customers/passwords#new', as: 'new_customer_password'
  end

  scope module: :public do # routeが被らないように
    resources :customers, only: %i[show edit update]
    get 'customer/favorite' => 'customers#favorite', as: 'customer_favorite'
    get 'confirm/:id' => 'customers#confirm', as: 'destroy_confirm' # 退会
    patch 'withdraw/:id' => 'customers#withdraw', as: 'withdraw_customer'
    resources :genres, only: %i[show index]
    resources :contacts, only: %i[new show create index]
    post 'contacts/confirm' => 'contacts#confirm'               # 確認画面
    get 'contact/thanks' => 'contacts#thank', as: 'contacts_thanks'
    resources :cuisines, only: %i[new index show create edit update destroy] do
      get 'cuisine_favorites' =>'cuisines#favorite', as: 'favorites'
      get :search, on: :collection                            # 検索機能
      resource :cuisine_favorites, only: %i[create destroy]  # いいね機能
      resources :cuisine_comments, only: %i[create destroy]  # コメント機能
    end
  end
end
