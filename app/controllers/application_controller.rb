class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

  private

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up,keys:[:email])
    end

    def after_sign_in_path_for(resource)
      if user_signed_in?
        articles_path
      else
        admin_articles_path
      end
    end

    def after_sign_out_path_for(resource)
      root_path
    end

    def after_sign_up_path_for(resource)
      articles_path
    end
end
