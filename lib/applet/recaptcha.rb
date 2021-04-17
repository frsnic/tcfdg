class Recaptcha
  def self.check_recaptcha(response)
    uri = URI('https://www.google.com/recaptcha/api/siteverify')
    https = Net::HTTP.new(uri.host, uri.port)
    https.use_ssl = true
    request = Net::HTTP::Post.new(uri.path)
    request.set_form_data(secret: Settings.recaptcha.secret_key, response: response)
    response = https.request(request)
    JSON.parse(response.body)['success'] == true
  end
end
