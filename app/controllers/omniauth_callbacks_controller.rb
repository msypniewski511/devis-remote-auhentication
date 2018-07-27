class OmniauthCallbacksController < ApplicationController
  def twitter
    user = User.process_omniauth(request.env["omniauth.auth"])
    if user.persisted?
      flash.notice = "Sign in!"
      sign_in_and_redirect user
    else
      session["devise.user_attibutes"] = user.attributes
      redirect_to new_user_registration_url
    end
  end
end
