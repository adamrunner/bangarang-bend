Rails.application.routes.draw do

  root 'main#index'

  resources :pages, only: [:index]
  resources :service_items, only: [:index]
  resources :event_items, only: [:index]
  resources :philosophy_items, only: [:index]
  resources :catering_menus, only: [:index, :show]

  devise_for :admin,
      class_name: 'AdminUser',
      controllers: {
      sessions: "admin/sessions",
      passwords: 'admin/passwords',
      unlocks: 'admin/unlocks'
    },
    path_names: {
      sign_in:  'login',
      sign_out: 'logout',
    }

  namespace :admin do
    root to: 'page#index'

    resources :admin_user

    resources :page, only: [:index, :show, :edit, :update] do
      resources :catering_menu, only: [:new, :create]
      resources :biography_item, only: [:new, :create]
      resources :featured_item, only: [:new, :create]
      resources :service_item, only: [:new, :create]
      resources :philosophy_item, only: [:new, :create]
      resources :event_item, only: [:new, :create]
      resources :event_produce_item, only: [:new, :create]
      resources :landing, only: [:new, :create]
      resources :food_truck_addresses, only: [:new, :create]
      resources :food_truck_image_rows, only: [:new, :create]
    end

    resources :biography_item, only: [:edit, :update, :destroy]
    resources :featured_item, only: [:edit, :update, :destroy]

    delete '/featured_item/:id/delete_img', to: 'featured_item#destroy_img', as: 'delete_featured_img'
    post '/featured_items/update_order', to: 'featured_item#update_order', as: 'update_order'
    delete '/biography_item/:id/delete_img', to: 'biography_item#destroy_img', as: 'delete_biography_img'

    resources :landing, only: [:edit, :update, :destroy]

    delete '/landing/:id/delete_img', to: 'landing#destroy_img', as: 'delete_landing_img'

    resources :service_item, only: [:edit, :update, :destroy]
    resources :philosophy_item, only: [:edit, :update, :destroy]
    resources :event_item, only: [:edit, :update, :destroy]
    resources :event_produce_item, only: [:edit, :update, :destroy]

    resources :catering_menu, only: [:show, :edit, :update, :destroy] do
      resources :menu_section, only: [:new, :create]
    end

    resources :menu_section, only: [:edit, :update, :destroy] do
      resources :menu_item, only: [:new, :create]
    end

    resources :menu_item, only: [:edit, :update, :destroy]

    resources :food_truck_addresses, only: [:edit, :update, :destroy]
    post '/food_truck_address/:id/set_active', to: 'food_truck_addresses#set_active', as: 'food_truck_address_set_active'
    resources :food_truck_image_rows, only: [:edit, :update, :destroy]

  end

  get '*path' => 'main#index', defaults:{path:"/"}

end
