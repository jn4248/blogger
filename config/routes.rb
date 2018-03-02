Rails.application.routes.draw do
  root to: 'articles#index'

  resources :articles do
    member do
      get :reset_number_of_views
    end
    collection do
      get :reset_number_of_views_all
    end
    resources :comments
  end

  resources :author_sessions, only: [ :new, :create, :destroy ]

  resources :authors do
    collection do
      delete :delete_all
    end
  end

  resources :tags

  #TRY USING "to:" instead of =>
  get 'login'  => 'author_sessions#new'
  get 'logout' => 'author_sessions#destroy'

end
