class StaticPagesController < ApplicationController	
	skip_authorization_check
	# authorize_resource :class => false
  def sales
  end

  def table
  end

  def takeout
  end
end
