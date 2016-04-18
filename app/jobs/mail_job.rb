class MailJob
  @queue = :mail_worker

  def self.perform(params)
    Mailer.contact(params).deliver_later
  end
end
