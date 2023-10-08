Rails.application.routes.draw do
  namespace :admin do
    get 'equipments/index'
    get 'equipments/facility'
    get 'equipments/edit'
  end
  namespace :admin do
    get 'comments/index'
  end
  namespace :admin do
    get 'posts/index'
  end
  namespace :admin do
    get 'facilities/index'
    get 'facilities/show'
    get 'facilities/edit'
  end
  namespace :admin do
    get 'users/index'
    get 'users/show'
  end
  namespace :user do
    get 'posts/index'
    get 'posts/show'
    get 'posts/new'
    get 'posts/edit'
  end
  namespace :user do
    get 'facilities/index'
    get 'facilities/show'
    get 'facilities/new'
    get 'facilities/edit'
  end
  namespace :user do
    get 'users/show'
    get 'users/edit'
  end
  namespace :admin do
    root to: 'homes#top'
  end
  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }

  scope module: :user do
    root to: 'homes#top'
  end
  # 顧客用
  # URL /users/sign_in ...
  devise_for :users, skip: [:passwords],  controllers: {
  registrations: "user/registrations",
  sessions: 'user/sessions'
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
