class StaticPagesController < ApplicationController	
	skip_authorization_check
	# authorize_resource :class => false
  def inventory
  end

  def table
  end

  def takeout
  end
end
