Rails.application.routes.draw do
  devise_for :admins, controllers: {
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
root to: 'public/homes#top'
get "about" => "top#about" , as: "about"
  #会員マイページ、会員情報編集ページ、退会確認ページ
get "customers/my_page" => "public/customers#show"
resource :customers, only: [:edit, :update]

get "customers/alert" => "public/customers#alert"
patch "customers/withdraw" => "public/customers#withdraw"

get "customers/products" => "public/products#index"
get "customers/product" => "public/product#show"

resources :cart_items, only: [:index, :create, :update, :destroy] do
  collection do
    delete 'destroy_all'
  end
end

 
   

  
  # 管理者
 namespace :admin do
    get "top" => "admin/homes#top"
    resources :products,only: [:index,:new,:create,:show,:edit,:update,]
    get "products/genres" =>"admin/genres#index"
    #会員一覧ページ、会員情報詳細ページ、会員情報編集ページ
    resources :customers, only: [:index, :show, :edit, :update]
  end

end
