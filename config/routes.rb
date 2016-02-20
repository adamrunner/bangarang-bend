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

  namespace :admin do
    root to: 'page#index'

    resources :admin_user

    resources :page, only: [:index, :show] do
      resources :catering_menu, only: [:new, :create]
    end

    resources :catering_menu, only: [:index, :show, :edit, :update, :destroy] do
      resources :menu_section, only: [:new, :create]
    end

    resources :menu_section, only: [:edit, :update, :destroy] do
      resources :menu_item, only: [:new, :create]
    end

    resources :menu_item, only: [:edit, :update, :destroy]

  end
end
