Motoparts::Application.routes.draw do

  devise_for :users, :skip => [:registrations]

  mount Mercury::Engine => '/'

  resources :sliders

  match '/admin_panel', to: 'admin_panels#show', as: :admin_panel

  resources :currencies

  resources :brands

  resource :contacts, only: :index

  resources :properties do
    get :units_from_property, on: :member

    resources :property_units
  end

  resources :property_units

  resources :units

  resource :shipments do
    put :mercury_update
  end

  resources :product_properties


  resources :categories do
    resources :folders, except: :index do
      resources :products, except: :index do
        get :filter, on: :collection
        put :mercury_update, on: :member
      end
    end
  end

  root :to => 'welcome#index'
end
