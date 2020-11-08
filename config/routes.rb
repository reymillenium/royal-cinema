Rails.application.routes.draw do

  # root :to => redirect("/pages")
  root :to => redirect("pages")

  # The extra_pages view (extra)
  get 'pages', to: 'pages#index'
end
