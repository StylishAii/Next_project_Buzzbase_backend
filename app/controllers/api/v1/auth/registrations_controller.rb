class Api::V1::Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController
  private

  def sign_up_params
    params.require(:registration).permit(:email, :password, :password_confirmation, :name, :user_id)
  end

  def render_create_success
    EmailAuthenticationMailer.send_when_signup(@resource.email, @resource.name).deliver_now
    super
  end
end
