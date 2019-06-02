Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  root to: "users/users#index"

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    users: 'users/users',
    mypage: 'users/mypage'
  }

  devise_scope :user do
    get "user_mypage", to: "users/mypage#index"
    get "show_user_mypage", to: "users/mypage#show"
  end

  devise_for :companies, controllers: {
    registrations: 'companies/registrations',
    entrances: 'companies/entrances',
    mypage: 'companies/mypage'
  }

  devise_scope :company do
    get "company_entrance", to: "companies/entrances#index"
    get "company_mypage", to: "companies/mypage#index"
    get "show_company_mypage", to: "companies/mypage#show"
  end
end
