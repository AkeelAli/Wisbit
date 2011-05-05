class ReadController < ApplicationController
  def index
		if params[:category]
			@category=params[:category]
		else
			@category=1
		end

		if params[:index]
			@index=params[:index].to_i
		else
			@index=0
  	end
		
		if @index==0
			@quotes=Category.find(@category).quotes.select("quote").order("score DESC").all
			session[:quotes]=@quotes
		end

	end

end
