Rails.application.routes.draw do
  resources :users, only: :create do
    collection do
      post 'confirm'
      post 'login'
    end
  end

  post 'passwords/forgot', to: 'passwords#forgot'
  post 'passwords/reset', to: 'passwords#reset'
  put 'passwords/update', to: 'passwords#update'

  resources :todos do
    resources :tasks
  end
end
