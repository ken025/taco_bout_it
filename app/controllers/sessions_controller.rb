class SessionsController < ApplicationController

  def omniauth
      # @user = User.from_omniauth(auth)
      # @user.save
      # session[:user_id] = @user.id
      # sign_in_and_redirect @user

      @user = User.from_omniauth(auth)
      @user.save
      # this is redirecting to my root route
      sign_in_and_redirect @user
    end

    private

  def auth
      request.env['omniauth.auth']
  end 
end
