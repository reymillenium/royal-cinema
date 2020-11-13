Rails.application.routes.draw do


  resources :contacts

  # The extra_pages view (extra)
  get 'pages', to: 'pages#index'

  # root :to => redirect("/pages")
  root :to => redirect("pages")
end
