class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

   protected
   def after_sign_in_path_for(user_path)
    current_user
   end
   def after_update_path_for(user_path)
    render"/users/#{current_user.id}"
   end
   def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :fname, :lname])
   end
end
