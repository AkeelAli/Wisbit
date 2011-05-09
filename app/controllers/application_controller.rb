class ApplicationController < ActionController::Base
  protect_from_forgery
  
  # Redirect to a default route when user inputs a wrong one
  def redirect
		logger.error "CUSTOM_ERROR: Attempt to connect with bad url extension: #{params[:from]}"
		redirect_to root_url
  end

end
