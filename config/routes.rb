# frozen_string_literal: true

Rails.application.routes.draw do
  get '/', to: 'static_pages#home'
  scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/ do
    get 'contact', to: 'static_pages#contact'
    get 'about', to: 'static_pages#about'
    root to: 'static_pages#home'
  end

end
