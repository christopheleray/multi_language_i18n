# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_locale
  # protect_from_forgery with: :exception

  private

  # keep the local variable used or default to fr
  def set_locale
    I18n.locale = current_user.try(:locale) || I18n.default_locale
  end

  def default_url_options
    { locale: I18n.locale }
  end
end
