# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'hi@steeple.com'
  layout 'mailer'
end
