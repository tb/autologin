class AutologinController < ApplicationController

  def login
    if authorize
      redirect_to root_path
    else
      redirect_to root_path, :alert => @error_message
    end
  end

  private

  def authorize
    if autologin = Autologin.authorize(params[:code])
      if request.env['warden'].present?
        # devise
        request.env['warden'].set_user(autologin.user, { :scope => :user })
      else
        # default
        self.current_user = autologin.user
      end
      true
    else
      @error_message = "Invalid code"
      false
    end
  end

end
