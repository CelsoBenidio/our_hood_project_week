class OmniauthCallbacksController < ApplicationController
  require "securerandom"
  skip_before_action :authenticate_user!
  skip_after_action :verify_authorized, only: [:google_oauth2, :facebook]

  def google_oauth2
    auth = request.env["omniauth.auth"]

    if User.where(provider: "facebook", email: auth["info"]["email"])
      redirect_back(fallback_location: root_path)
      flash[:alert] = "User not found"
    else
      user = User.where(provider: auth["provider"], uid: auth["uid"])
              .first_or_initialize(email: auth["info"]["email"])
      user.name ||= auth["info"]["name"]
      user.password = SecureRandom.urlsafe_base64
      user.save!

      user.remember_me = true
      sign_in(:user, user)
      redirect_to after_sign_in_path_for(user)
    end
  end

  def facebook
    if User.where(provider: "google_oauth2", email: auth["info"]["email"])
      redirect_back(fallback_location: root_path)
      flash[:alert] = "User not found"
    else
      # You need to implement the method below in your model (e.g. app/models/user.rb)
      auth = request.env["omniauth.auth"]

      @user = User.from_omniauth(auth)

      if @user.persisted?
        sign_in_and_redirect @user, event: :authentication #this will throw if @user is not activated
        flash[:alert] = "You signed in successfully!"
      else
        session["devise.facebook_data"] = request.env["omniauth.auth"]
        redirect_to new_user_registration_url
      end
    end
  end

  def failure
    redirect_to root_path
  end
end


