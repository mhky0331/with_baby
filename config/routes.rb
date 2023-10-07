Rails.application.routes.draw do
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
