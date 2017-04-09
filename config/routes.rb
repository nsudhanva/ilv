Rails.application.routes.draw do
  get 'dashboards/index'

  resources :income_types
  resources :expense_types
  resources :payment_types
  resources :resident_types
  resources :expenses
  resources :incomes
  resources :residents

  root to: "dashboards#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
