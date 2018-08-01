class OmniauthCallbacksController < ApplicationController
  def provider
    user = User.process_omniauth(request.env["omniauth.auth"])
    if user.persisted?
      flash.notice = "Sign in!"
      sign_in_and_redirect user
    else
      session["devise.user_attibutes"] = user.attributes
      redirect_to new_user_registration_url
    end
  end

  alias_method :twitter, :provider
  alias_method :facebook, :provider
  alias_method :github, :provider
end
