# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_locale
  rescue_from ActionController::ParameterMissing, with: :bad_parameters
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
  # protect_from_forgery with: :exception

  private

  def bad_parameters(exception)
    flash[:error] = e.message
    redirect_to(root_path)
  end

  def record_not_found
    flash[:error] = t(:record_not_found)
    redirect_to(root_path)
  end

  def record_invalid(e)
    # L'exception contient le post qui a échoué
    flash[:error] = t('record_invalid', e: e.record.errors.full_messages.join(", "))
    redirect_to(home_path)
  end

  # keep the local variable used or default to fr
  def set_locale
    I18n.locale = current_user.try(:locale) || I18n.default_locale
  end

  def default_url_options
   { locale: I18n.locale }
  end
end
