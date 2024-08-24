Rails.application.routes.draw do
  # поправь роуты чтобы совпадало то, что генерит rails routes, + нужно тесты контроллера еще сделать через rspec
  resources :students, only: [:create, :destroy]

  resources :schools, only: [] do
    resources :classes, only: :index do
      resources :students, only: :index
    end
  end
end
