class OmniauthController < ApplicationController
    def facebook
        @user=User.create_from_provider_data(request.env['omniauth.auth'])
        if @user.persisted?
            sign_in_and_redirect @user
        else
         flash[:error] = 'There Was A Problem'
         redirect_to new_user_registration_url
        end
    end


  def failure
    redirect_to new_user_registration_url
  end
end
