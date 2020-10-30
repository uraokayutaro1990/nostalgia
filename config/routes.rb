Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'items#index'
  resources :items do
  # 7つのアクションをまとめる[:index, :new ,:create ,:destroy ,:edit ,:update, :show ]
  collection do
    get 'search'
  end
end
  # idを取得しないサーチ方法
  resources :users, only: :show
end

