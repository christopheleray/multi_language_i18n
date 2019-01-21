# frozen_string_literal: true

Rails.application.routes.draw do
  scope ":locale", locale: /fr|en/ do
    get 'contact', to: 'static_pages#contact'
    get 'about', to: 'static_pages#about'
    root to: 'static_pages#home'
  end
end
