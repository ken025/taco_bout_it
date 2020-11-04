class RegistrationsController < Devise::RegistrationsController
    # skip_before_action :authenticate_user!, except: :google_auth2

    private

    def sign_up_params
        params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
    end

    def account_update_params
        params.require(:user).permit(:name, :username, :email, :password, :password_confirmation, :current_password)
    end
end