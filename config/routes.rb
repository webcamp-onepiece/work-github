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
 
   
resource :receivers, only: [:index, :create, :edit, :update, :destroy,]

  
  # 管理者
 namespace :admin do
    get "top" => "admin/homes#top"
    resources :products,only: [:index,:new,:create,:show,:edit,:update,]
    get "products/genres" =>"admin/genres#index"
  
    resources :customers, only: [:index, :show, :edit, :update]
  end

end
