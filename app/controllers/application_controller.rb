class ApplicationController < ActionController::API
        include DeviseTokenAuth::Concerns::SetUserByToken
        before_action do
                I18n.locale = :ja
        end
        before_action :configure_permitted_parameters, if: :devise_controller?

        def configure_permitted_parameters
                devise_parameter_sanitizer.permit(:account_update, keys: [:name, :user_id])
        end
end
