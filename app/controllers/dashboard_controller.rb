class DashboardController < ApplicationController

  def index
        @ratboard=Board.for_today.first
        @salesreps = Role.find(2).users
        
        
  end

end
