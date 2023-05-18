Rails.application.routes.draw do

  # 管理者側のルーティング設定
  namespace :admin do
    resources :orders, only:[:show, :update]
    resources :order_details, only:[:update]
    resources :customers, only:[:index, :show, :edit, :update]
    resources :genres, only:[:index, :edit, :create, :update]
    resources :items, only:[:index, :new, :show, :edit, :create, :update]
    root to: 'homes#top'
  end

  # 会員側のルーティング設定
  scope module: :public do
    resources :shipping_addresses, only:[:index, :edit, :create, :update, :destroy]
    resources :orders, only:[:new, :index, :show, :create]
    post 'orders/confirm'
    get 'orders/thanks'
    resources :cart_items, only:[:index, :create, :update, :destroy]
    delete 'cart_items/destroy_all'
    resource :customers, only:[:edit, :update]
    get 'customers/mypage' =>'customers#show'
    get 'customers/confirm'
    patch 'customers/withdraw'
    resources :items, only:[:show, :index]
    root to: 'homes#top'
    get '/about' =>'homes#about'
  end

# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
