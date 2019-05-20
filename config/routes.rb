Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  root to: "users/users#index"
  devise_scope :user do
    get "index", to: "users/users#index", as: "home"
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    users: 'users/users'
  }
end
