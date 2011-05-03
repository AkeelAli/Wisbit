class MashController < ApplicationController
  def index
  		@quotes=Category.find(params[:category]).quotes
	end

end
