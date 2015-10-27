Motoparts::Application.routes.draw do
  devise_for :users

  mount Mercury::Engine => '/'

  resources :sliders

  resource :admin_panels, only: [:show]

  resources :categories do
    resources :folders do
      resources :products, except: :index do
        put :mercury_update, on: :member
      end
    end
  end

  root :to => 'welcome#index'
end
