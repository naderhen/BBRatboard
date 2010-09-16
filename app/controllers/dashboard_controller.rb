class DashboardController < ApplicationController
before_filter :require_user
  def index
        @ratboard=Board.for_today.first
        @salesreps = Role.find(2).users
        if @ratboard 
          @sales=@ratboard.sales
          @my_sales = @sales.find(:all, :conditions=>["user_id=?", current_user.id]) 
        end
        
  end

end
