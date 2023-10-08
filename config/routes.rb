Rails.application.routes.draw do
  namespace :admin do
    get '/' => 'homes#top'

    resources :posts,only: [:show, :destroy]

    patch 'users/:id/withdraw' => 'users#withdraw'
    resources :users,only: [:index, :show]

    resources :genres,only: [:index, :create, :edit, :update]
  end

  scope module: :public do

    root "homes#top"
    get 'homes/about'

    get 'users/confirm_withdraw' => 'users#confirm_withdraw'
    patch 'users/withdraw' => 'users#withdraw'
    resources :users,only: [:index, :show, :edit, :update]

    resources :posts

  end



  # ユーザー用
# URL /users/sign_in ...
devise_for :users, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
