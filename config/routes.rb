Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  root to: "users/top#index"

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    top: 'users/top',
    admin: 'users/admin'
  }

  namespace :users do
    resources :admin, only:[:index, :show]
  end

  devise_for :companies, controllers: {
    registrations: 'companies/registrations',
    top: 'companies/top',
    admin: 'companies/admin'
  }

  namespace :companies do
    resources :admin, only:[:index, :show]
    resources :top, only:[:index]
  end

end
