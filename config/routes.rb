Motoparts::Application.routes.draw do
  mount Mercury::Engine => '/'

  resources :sliders

  resources :categories do
    resources :folders do
      resources :products, except: :index
    end
  end

  root :to => 'welcome#index'
end
