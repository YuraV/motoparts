Motoparts::Application.routes.draw do

  devise_for :users, :skip => [:registrations]

  mount Mercury::Engine => '/'

  resources :sliders

  match '/admin_panel', to: 'admin_panels#show', as: :admin_panel

  resources :currencies

  resources :categories do
    resources :folders, except: :index do
      resources :products, except: :index do
        put :mercury_update, on: :member
      end
    end
  end

  root :to => 'welcome#index'
end
