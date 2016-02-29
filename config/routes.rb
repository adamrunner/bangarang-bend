Rails.application.routes.draw do

  root 'main#index'

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

  resources :service_items, only: [:index]
  resources :event_items, only: [:index]
  resources :philosophy_items, only: [:index]

  namespace :admin do
    root to: 'page#index'

    resources :admin_user

    resources :page, only: [:index, :show] do
      resources :catering_menu, only: [:new, :create]
      resources :biography_item, only: [:new, :create]
      resources :featured_item, only: [:new, :create]
      resources :service_item, only: [:new, :create]
      resources :philosophy_item, only: [:new, :create]
      resources :event_item, only: [:new, :create]
      resources :event_produce_item, only: [:new, :create]
    end

    resources :biography_item, only: [:edit, :update, :destroy]
    resources :featured_item, only: [:edit, :update, :destroy]

    delete '/featured_item/:id/delete_img', to: 'featured_item#destroy_img', as: 'delete_featured_img'

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

  end
end
