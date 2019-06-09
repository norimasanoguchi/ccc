Rails.application.routes.draw do
  root to: "users/top#index"

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    top: 'users/top',
    admin: 'users/admin'
  }
  devise_scope :user do
    #なぜかログアウトのリンクがgetメソッドで飛ばされるため明示
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  namespace :users do
    resources :admin, only:[:index, :show]
  end

  devise_for :companies, controllers: {
    registrations: 'companies/registrations',
    top: 'companies/top',
    admin: 'companies/admin'
  }

  devise_scope :company do
    #なぜかログアウトのリンクがgetメソッドで飛ばされるため明示
    get '/companies/sign_out' => 'companies/sessions#destroy'
  end

  namespace :companies do
    resources :admin, only:[:index, :show]
    resources :top, only:[:index]
  end

  resources :conversations do
    resources :messages
  end

end
