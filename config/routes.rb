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
root to: 'public/homes#top'
get "about" => "top#about" , as: "about"
  #会員マイページ、会員情報編集ページ、退会確認ページ
get "customers/my_page" => "public/customers#show"
resource :customers, only: [:edit, :update]

get "customers/alert" => "public/customers#alert"
patch "customers/withdraw" => "public/customers#withdraw"

  #注文情報
  resources :orders, only: [:index,:new,:create,:show], module: "public" do
    collection do
      post "confirm"
      get "thankyou"
    end
  end

  # 管理者
  namespace :admin do
    get "top" => "homes#top"
    resources :products,only: [:index,:new,:create,:show,:edit,:update,]
    get "products/genres" =>"admin/genres#index"
    #会員一覧ページ、会員情報詳細ページ、会員情報編集ページ
    resources :customers, only: [:index, :show, :edit, :update]
  end

end
