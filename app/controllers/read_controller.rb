class ReadController < ApplicationController
  def index
		@index=params[:index]?params[:index]:0
		@index=@index.to_i
		
		if params[:category]
				reset_session
				object_ids=Category.find(params[:category]).quotes.select("id").order("score DESC").all
				ids=[]
				object_ids.each do |object|
					ids.push(object.id)
				end
				session[:quote_ids]=ids
				session[:size]=ids.count
		end	
		
		if @index>session[:size]-1
			#reset
			@index=0
		end
		
		@quote_text=Quote.find(session[:quote_ids][@index]).quote
		
		
	end

end
