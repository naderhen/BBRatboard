
class ApplicationController < ActionController::Base
  helper :all
  protect_from_forgery

  
  helper_method :current_user  

    private  
    def current_user_session  
      return @current_user_session if defined?(@current_user_session)  
      @current_user_session = UserSession.find  
    end  

    def current_user  
      @current_user = current_user_session && current_user_session.record  
    end
    
    
    def require_user
      unless current_user
        flash[:notice] = "You must be logged in to access this page"
        redirect_to login_path
        return false
      end
    end
    
    
    def require_admin
      unless current_user.admin?
        flash[:notice] = "You are not authorized to do this!"
        redirect_to root_url
        return false
      end
    end
    
    def require_staff
      session[:return_to] ||= request.referer
      
      unless current_user.staff?
        flash[:notice] = "You are not authorized to do this!"
        redirect_to session[:return_to]
        return false
      end
    end
    
    
    protected
        def render_optional_error_file(status_code)
          status = interpret_status(status_code)
          render :template => "/errors/#{status[0,3]}.html.erb", :status => status, :layout => 'application.html.erb'
        end
        


end
