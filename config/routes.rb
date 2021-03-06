# frozen_string_literal: true

Rails.application.routes.draw do
  get '/', to: 'static_pages#home', as: :home
  # (:locale) not compulsory
  # could be locale: /fr|en/
  # could be locale: /#{I18n.available_locales.join("|")}/
  scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/ do
    get 'contact', to: 'static_pages#contact'
    get 'about', to: 'static_pages#about'
    root to: 'static_pages#home'
    devise_for :users, controllers: {
      registrations: 'users/registrations'
    }
    resources :users, only: [:show] do
      resources :posts, only: %i[index new create show]
    end
  end
end
