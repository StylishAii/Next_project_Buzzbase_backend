class CustomConfirmationsController < DeviseTokenAuth::ConfirmationsController
  def show
    @resource = resource_class.confirm_by_token(params[:confirmation_token])

    if @resource.errors.empty?
      redirect_url = your_custom_path(@resource)
      render json: { message: 'Confirmation successful.', redirect_url: }, status: :ok
    else
      render json: { message: @resource.errors.full_messages.join(', ') }, status: :unprocessable_entity
    end
  end

  private

  def your_custom_path(_resource)
    token = params[:confirmation_token]
    "#{ENV.fetch('CONFIRM_SUCCESS_URL', nil)}?confirmation_token=#{token}"
  end
end
