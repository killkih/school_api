Rails.application.routes.draw do
  resources :students, only: [:create, :destroy]
end
