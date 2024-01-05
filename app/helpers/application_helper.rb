module ApplicationHelper
  def custom_confirmation_url(_resource, token)
    `#{ENV.fetch('CONFIRM_SUCCESS_URL', nil)}?confirmation_token=#{token}`
  end
end
