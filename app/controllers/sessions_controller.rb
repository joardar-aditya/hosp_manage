class SessionsController < ApplicationController
  def new
  end

  def create

    if params[:admin_button] 
      admin = Admin.find_by_email(params[:email])
      if admin && admin.authenticate(params[:password])
        session[:id] = admin.id 
        redirect_to patients_path 
      else 
        redirect_to '/sessions/new', danger: "Invalid Credentials for Admin"
      end
    else
       user = User.find_by_email(params[:email])
       if user && user.authenticate(params[:password])
         session[:id] = user.id
         redirect_to "/patients"
       else
         redirect_to "/sessions/new", danger: "Invalid Credentials"
       end
  end
end 
end
