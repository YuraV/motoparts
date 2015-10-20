Motoparts::Application.routes.draw do
  mount Mercury::Engine => '/'

  resources :sliders

  resources :categories do
    resources :folders do
      resources :products do
        put :mercury_update, on: :member
      end
    end
  end

  root :to => 'welcome#index'
end
