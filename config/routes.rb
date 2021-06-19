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
get "about" => "public/homes#about" , as: "about"

get "customers/my_page" => 'public/customers#show'

resource :customers, only: [:edit, :update]


get "customers/alert" => "public/customers#alert"
patch "customers/withdraw" => "public/customers#withdraw"
 
   

  
  # 管理者
 namespace :admin do
    get "top" => "admin/homes#top"
    resources :products,only: [:index,:new,:create,:show,:edit,:update,]
    get "products/genres" =>"admin/genres#index"
  
    resources :customers, only: [:index, :show, :edit, :update]
  end

end
