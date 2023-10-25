Rails.application.routes.draw do

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }

  namespace :admin do
    root to: 'homes#top'
    resources :users, only: [:index, :show, :update]
    resources :facilities, only: [:index, :show, :edit, :update, :destroy]
    resources :posts, only: [:index, :destroy]
    resources :comments, only: [:index, :destroy]
    resources :equipments, only: [:index, :create, :edit, :update, :destroy]
    patch "withdrawal/:id" => "users#withdrawal", as: "withdrawal"
  end

  # 会員用
  # URL /users/sign_in ...
  devise_for :users, skip: [:passwords],  controllers: {
  registrations: "user/registrations",
  sessions: 'user/sessions'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'user/sessions#guest_sign_in'
  end

  scope module: :user do
    root to: 'homes#top'
    get "search" => "posts#search"
  end

  namespace :user do
    resources :comments, only: [:index]
    resources :favorites, only: [:index]
    resource :user, only: [:show, :edit, :update]
    resources :facilities do
      resources :posts, only: [:new, :create]
      resources :favorites, only: [:index, :create, :destroy]
    end
    resources :posts, exist: [:new, :create] do
      resources :comments, only: [:index, :create, :destroy]
    end
  end

  #地図機能実装
  resources :maps, only: [:index, :show, :new]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
