class StaticPagesController < ActionController::Base
  
  def help
    @support = Support.new
  end
  
  def privacy
  end

end
