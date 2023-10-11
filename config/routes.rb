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
  end

  # 会員用
  # URL /users/sign_in ...
  devise_for :users, skip: [:passwords],  controllers: {
  registrations: "user/registrations",
  sessions: 'user/sessions'
  }

  scope module: :user do
    root to: 'homes#top'
  end

  namespace :user do
    resource :user, only: [:show, :edit, :update]
    resources :facilities
    resources :posts
    resources :comments, only: [:index, :create, :destroy]
    resources :favorites, only: [:index, :create, :destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
