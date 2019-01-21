# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_locale

  private
  # keep the local variable used or default to fr
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
   { locale: I18n.locale }
  end
end
