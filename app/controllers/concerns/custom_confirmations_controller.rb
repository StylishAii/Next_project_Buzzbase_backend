class CustomConfirmationsController < DeviseTokenAuth::ConfirmationsController
  def show
    super do |resource|
      redirect_url = your_custom_path(resource)
      redirect_to redirect_url, allow_other_host: true
    end
  end

  private

  def your_custom_path(_resource)
    token = params[:confirmation_token]
    "#{ENV.fetch('CONFIRM_SUCCESS_URL', nil)}?confirmation_token=#{token}"
  end
end
