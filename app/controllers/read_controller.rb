class ReadController < ApplicationController
  def index
  	@quotes=Quote.find(:all)
	end

end
