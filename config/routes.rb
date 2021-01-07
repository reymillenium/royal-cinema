Rails.application.routes.draw do

  # devise_for :users
  #
  # devise_for :users, controllers: {
  #   # confirmations: 'users/confirmations'
  #   confirmations: 'users/confirmations',
  #   registrations: 'users/registrations',
  #   sessions: 'users/sessions'
  # }


  # devise_for :users, skip: [:registrations]
  devise_for :users, skip: [:registrations], controllers: {
    # confirmations: 'users/confirmations'
    confirmations: 'users/confirmations',
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  as :user do
    # get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    # put 'users' => 'devise/registrations#update', :as => 'user_registration'

    get 'users/edit' => 'users/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'users/registrations#update', :as => 'user_registration'
  end

  resources :contacts do
    get :block_contact, on: :member
    get :unblock_contact, on: :member
  end
  resources :skills
  resources :references
  resources :samples

  # The extra_pages view (extra)
  get 'pages', to: 'pages#index'

  # root :to => redirect("/pages")
  root to: redirect("pages")
end
