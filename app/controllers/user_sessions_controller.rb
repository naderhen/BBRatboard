class UserSessionsController < ApplicationController
  def new  
    @user_session = UserSession.new  
    render :layout=>"login"
  end
  
  def create  
    @user_session = UserSession.new(params[:user_session])  
    if @user_session.save  
      flash[:notice] = "Successfully logged in."  
      if current_user.staff?
        redirect_to root_url and return 
      else
        redirect_to reports_path and return
      end  
    else  
      render :action => 'new'  
    end  
  end
  
  def destroy  
    @user_session = UserSession.find  
    @user_session.destroy  
    flash[:notice] = "Successfully logged out."  
    redirect_to root_url  
  end

end
