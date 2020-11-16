class RegistrationsController < Devise::RegistrationsController
#overwriting the devise's default strong params to include: name, username and image
    private

    def sign_up_params
        params.require(:user).permit(:name, :username, :image, :email, :password, :password_confirmation)
    end

    def account_update_params
        params.require(:user).permit(:name, :username, :image, :email, :password, :password_confirmation, :current_password)
    end
end