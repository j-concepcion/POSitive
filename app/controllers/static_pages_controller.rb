class StaticPagesController < ApplicationController	
	skip_authorization_check
	# authorize_resource :class => false

  def sales_report_create
    # @report_date = params[:date]
     @report_date = Date.parse("#{params[:date]['day']}-#{params[:date]['month']}-#{params[:date]['year']}") if params[:date]
    if params[:report_type]["daily"]
      render file: 'static_pages/_sales'
    else params[:report_type]["_monthly"]
      render file: 'static_pages/_monthly'
    end  
    # raise 'got here!'
  end

  def table
  end

  def one
  end

  def two
  end

  def three
  end

  def four
  end

  def five
  end

  def six
  end
  
  def seven
  end

  def takeout
  end
end
