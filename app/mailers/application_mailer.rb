class ApplicationMailer < ActionMailer::Base
  default from: Setting.email.noreply

  def self.smtp_settings
    Setting.smtp.symbolize_keys
  end

  def self.raise_delivery_errors
    Setting.raise_delivery_errors
  end

end
