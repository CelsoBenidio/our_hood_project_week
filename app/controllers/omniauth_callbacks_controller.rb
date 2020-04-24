class OmniauthCallbacksController < ApplicationController
  require "securerandom"
  skip_before_action :authenticate_user!

    def google_oauth2
      auth = request.env["omniauth.auth"]
      is_new = !User.where(provider: auth["provider"], uid: auth["uid"]).any?

      user = User.where(provider: auth["provider"], uid: auth["uid"])
              .first_or_initialize(email: auth["info"]["email"])
      user.name ||= auth["info"]["name"]
      user.password = SecureRandom.urlsafe_base64
      user.save!

      user.remember_me = true
      sign_in(:user, user)
      current_or_guest_user(is_new)
      redirect_to after_sign_in_path_for(user)
    end
end


