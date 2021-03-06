class Backend::Devise::SessionsController < Devise::SessionsController
  prepend_before_action :check_grecaptcha, only: [:create]
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  private

  def check_grecaptcha
    if Recaptcha.check_recaptcha(params['g-recaptcha-response'])
      true
    else
      self.resource = resource_class.new sign_in_params
      respond_with_navigational(resource) { render :new }
    end
  end

end
