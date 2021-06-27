Rails.application.routes.draw do
  devise_for :admins, path: 'admin', controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
  }
  devise_for :customers, controllers: {
  sessions:      'customers/sessions',
  passwords:     'customers/passwords',
  registrations: 'customers/registrations'
}

  #カスタマー
  scope module: :public do

    root to: 'homes#top'
    get "about" => "homes#about" , as: "about"

    get "customers/my_page" => 'customers#show'
    get "customers/my_page/edit" => 'customers#edit', as: "my_page_edit"
    patch "customers/edit" => 'customers#update'


    get "customers/alert" => "customers#alert"
    patch "customers/withdraw" => "customers#withdraw"
      resources :cart_items, only: [:index, :create, :update, :destroy] do
      collection do
        delete 'destroy_all'
      end
    end


    get "products" => "products#index"
    get "product/:id" => "products#show", as: 'customers_product'

    #注文
    resources :orders, only: [:index,:new,:create,:show] do
      collection do
        post "confirm"
        get "thankyou"
      end
    end

    # 配送先
    resources :receivers, only: [:index, :create, :edit, :update, :destroy,]
  end



  # 管理者
  namespace :admin do
    get "/" => "homes#top", as: "top" 
    scope :products do
      resources :genres,only: [:index,:create,:edit,:update, :show]
    end
    resources :products,only: [:index,:new,:create,:show,:edit,:update,]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update] do
      resources :order_products, only: [:update]
    end
  end

end
