Rails.application.routes.draw do
  root to: 'articles#index'

  resources :articles do
      resources :comments
  end
  resources :tags
  resources :authors do
    collection do
        delete :delete_all
    end
  end
  resources :author_sessions, only: [ :new, :create, :destroy ]

  get 'login'  => 'author_sessions#new'
  get 'logout' => 'author_sessions#destroy'

end
