Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  root to: "users/users#index"

  devise_scope :user do
    get "user_mypage", to: "users/mypage#index"
    get "show_user_mypage", to: "users/mypage#show"
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    users: 'users/users',
    users: 'users/mypage'
  }
end
