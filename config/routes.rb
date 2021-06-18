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
  
  #会員マイページ、会員情報編集ページ、退会確認ページ
get "customers/my_page" => "customers#show"
resource :customers, only: [:edit, :update]
get "customers/alert" => "customers#alert"
patch "customers/withdraw" => "customers#withdraw"






  # 管理者
  namespace :admin do
    get "top" => "admin/homes#top"
    
    #会員一覧ページ、会員情報詳細ページ、会員情報編集ページ
    resources :customers, only: [:index, :show, :edit, :update]
    
  end

end
