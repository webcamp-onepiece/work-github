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




  # 管理者
  namespace :admin do
    get "top" => "admin/homes#top"
    resources :products,only: [:index,:new,:create,:show,:edit,:update,]
  	get 'top'=>'products#top'
  	resources :genres,only: [:index,:create,:edit,:update, :show]
  end

end
