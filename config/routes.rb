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
get "customers/my_page/edit" => 'public/customers#edit', as: "my_page_edit"
patch "customers" => 'public/customers#update'


get "customers/alert" => "public/customers#alert"
patch "customers/withdraw" => "public/customers#withdraw"


get "customers/products" => "public/products#index"
get "customers/product" => "public/products#show"

resources :cart_items, only: [:index, :create, :update, :destroy] do
  collection do
    delete 'destroy_all'
  end
end

 
   
resource :receivers, only: [:index, :create, :edit, :update, :destroy,]




  # 管理者
 namespace :admin do
    get "top" => "admin/homes#top"

    scope :products do
    resources :genres,only: [:index,:create,:edit,:update, :show]
    end

    resources :products,only: [:index,:new,:create,:show,:edit,:update,]

    get "products/genres" =>"admin/genres#index"
    resources :customers, only: [:index, :show, :edit, :update]
  end

end
