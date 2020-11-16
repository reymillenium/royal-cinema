Rails.application.routes.draw do

  devise_for :users
  # devise_for :users, controllers: {
  #   # confirmations: 'users/confirmations'
  #   confirmations: 'users/confirmations',
  #   registrations: 'users/registrations',
  #   sessions: 'users/sessions'
  # }

  resources :contacts

  # The extra_pages view (extra)
  get 'pages', to: 'pages#index'

  # root :to => redirect("/pages")
  root :to => redirect("pages")
end
