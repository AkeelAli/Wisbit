class MashController < ApplicationController
	#Matchup algorithm determining which quotes to show/display
	#It starts with a sorted array of the quotes based on their previous
	#number of matchups (array a1)
	#It creates matchups of these quotes in the following order:
	#*matchups with quotes having the lowest previous matchups are favored
	#*repetition of qutoes is minimized (quotes repeated only after cycle)
	#
	#input: array a1 with sorted quotes
	#output: result array containing list of quotes in matchup order
	#


	def circular_left_shift(a)
		f=a.delete_at(0)
		a.push(f)
	end

	#input: array of quotes a1 sorted by matchups
	def matchup(a1)
		a2=a1.dup
		left_shifts=0
		n=a1.length
		result=[]

		while (left_shifts < n-1) do
			a2=circular_left_shift(a2)
			left_shifts+=1

			s1=0
			s2=n-left_shifts
			
			while (s1<s2) do
				if (a1[s1].matchups+a2[s1].matchups) <= (a1[s2].matchups+a2[s2].matchups)
					result.push(a1[s1],a2[s1])
					s1+=1
				else
					result.push(a1[s2],a2[s2])
					s2-=1
				end
			end

		end
		
		return result
	end
  
	def index
		#allow only POST requests (i.e. by clicking on quote link) OR from the category listing( without a win parameter which could change the db)
		if (request.post?) or (params[:category] and (not params[:win]))
			begin
				if params[:category]
					#setup at start of round
					reset_session
					object_ids=Category.find(params[:category]).quotes.find(:all, :select=>'id')
					ids=[]
					object_ids.each do |object|
						ids.push(object.id)
					end
					session[:quote_ids]=ids
					session[:category]=Category.find(params[:category]).name
					session[:size]=ids.count
					
					@start=1
				end
				
				if params[:win]
					#if there was a previous round, then update stats		
					win=params[:win]
					win=win.to_i
					
					q1=Quote.find(session[:id1])
					q1.matchups+=1
						
					q2=Quote.find(session[:id2])
					q2.matchups+=1
						
					if win==1
						q1.score+=0.1
					elsif win==2
						q2.score+=0.1
					end
						
					q1.save
					q2.save
				end

				quote_ids=session[:quote_ids]
				size=session[:size]
				
				rand=rand(size)
				q1=Quote.find(quote_ids[rand])
				q2=q1
		
				while (q1.id==q2.id) do
					rand=rand(size)
					q2=Quote.find(quote_ids[rand])
				end
				
				session[:id1]=q1.id
				session[:id2]=q2.id

				@quote1_text=q1.quote
				@quote2_text=q2.quote
				@quote1_score=q1.score.to_i
				@quote2_score=q2.score.to_i


		
		
				#padding to balance both quotes
				#length1=session[:matched_quotes][@index].quote.length
				#length2=session[:matched_quotes][@index+1].quote.length
				#diff_h=(length1-length2).abs/2

				#if (length1>length2)
					#@quote2_text="&nbsp; ".html_safe*diff_h+session[:matched_quotes][@index+1].quote+"&nbsp; ".html_safe*diff_h
					#@quote1_text=session[:matched_quotes][@index].quote
				#else
					#@quote1_text="&nbsp; ".html_safe*diff_h+session[:matched_quotes][@index].quote+"&nbsp; ".html_safe*diff_h
					#@quote2_text=session[:matched_quotes][@index+1].quote
				#end

				
				#social bar
				#social_url="http://www.google.com"
				#social_title="title"
				#@quote1_social="<a href=\"http://twitter.com/share\" class=\"twitter-share-button\" data-url=\"".html_safe+social_url+"\" data-text=\"".html_safe+social_title+"\" data-count=\"horizontal\">Tweet</a><script type=\"text/javascript\" src=\"http://platform.twitter.com/widgets.js\"></script>".html_safe
				#@quote1_social+="<iframe style=\" display:inline; margin-left:200px; padding:0;\" src=\"http://www.facebook.com/plugins/like.php?href=url.goes%2Fhere&amp;send=false&amp;layout=button_count&amp;width=450&amp;show_faces=false&amp;action=like&amp;colorscheme=light&amp;font&amp;height=21\" scrolling=\"no\" frameborder=\"0\" style=\"border:none; overflow:hidden; width:450px; height:21px;\" allowTransparency=\"true\"></iframe>".html_safe
			rescue ActiveRecord::RecordNotFound
				logger.error "CUSTOM_ERROR: Attempt to access invalid record with category: #{params[:category]} and win: #{params[:win]}"
				redirect_to root_url, :notice=>'Oops... something went wrong. I\'ll be on it in a second.'
			end
		else
			logger.error "CUSTOM_ERROR: Attempt to mash without POST method. category:#{params[:category]} and win: #{params[:win]}"
			redirect_to root_url
		end
	end

end
