Rails.application.routes.draw do

  namespace :public do
    get 'relationships/followings'
    get 'relationships/followers'
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


  namespace :admin do
    get '/' => 'homes#top'

    resources :posts,only: [:show, :destroy]


    patch 'users/:id/withdraw' => 'users#withdraw', as: 'users_withdraw'
    resources :users,only: [:index, :show, :update]

    resources :genres,only: [:index, :create, :edit, :update, :destroy]
  end

  scope module: :public do

    root "homes#top"
    # ゲストログイン用


    get 'homes/about'

    get 'users/confirm_withdraw' => 'users#confirm_withdraw'
    patch 'users/withdraw' => 'users#withdraw'

    post 'guest_sign_in', to: 'users#guest_sign_in'
    post 'users/search' => 'users#search'
    resources :users,only: [:index, :show, :edit, :update] do
      # ユーザーIDが含まれるURLを作成できる
      member do
        get :favorites
      end

      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
      resource :relationships, only: [:create, :destroy]
    end


    resources :posts do
      resources :post_comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end

  end




  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
