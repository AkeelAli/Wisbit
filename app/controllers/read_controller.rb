class ReadController < ApplicationController
  def index
		begin
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
					session[:category]=Category.find(params[:category]).name
					session[:size]=ids.count
			end	
			
			if @index>session[:size]-1
				#reset
				@index=0
			end
			
			@quote_text=Quote.find(session[:quote_ids][@index]).quote
			@quote_score=Quote.find(session[:quote_ids][@index]).score.to_i
		rescue ActiveRecord::RecordNotFound
			logger.error "CUSTOM_ERROR: Attempt to access invalid record with category #{params[:category]}"
			redirect_to root_url, :notice=>'Oops... something went wrong. I\'ll be on it in a second.'
		end		
		
	end

end
