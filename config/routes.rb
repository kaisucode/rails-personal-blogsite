Rails.application.routes.draw do
  get 'welcome/index'
  get 'articles/admin', to: 'articles#admin'

  resources :articles

  root 'welcome#index'
end
