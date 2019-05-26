Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  root to: "users/top#index"

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    top: 'users/top',
    admin: 'users/admin'
  }

  devise_scope :user do
    get "users/admin", to: "users/admin#index"
    get "users/admin/:id", to: "users/admin#show"
  end

  devise_for :companies, controllers: {
    registrations: 'companies/registrations',
    top: 'companies/top',
    admin: 'companies/admin'
  }

  devise_scope :company do
    get "company/top", to: "companies/top#index"
    get "company/admin", to: "companies/admin#index"
    get "company/admin/:id", to: "companies/admin#show"
  end
end
