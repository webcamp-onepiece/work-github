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
root to: 'homes#top'
get "about" => "top#about" , as: "about"



  # 管理者
  namespace :admin do
    get "top" => "admin/homes#top"
  end

end
