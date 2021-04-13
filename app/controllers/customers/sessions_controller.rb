# frozen_string_literal: true

class Customers::SessionsController < Devise::SessionsController
   #before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create #退会した会員がログインできないように
      @customer = Customer.find_by(email: params[:customer][:email])
      if @customer && @customer.is_valid == false
        redirect_to root_path
        flash[:notice] = "退会済みのアカウントです"
      else
        super
      end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
