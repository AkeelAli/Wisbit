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
			@category=params[:category]
			
			if (params[:index])
				@index=params[:index].to_i
			else
				@index=0
			end
			
			if @index==0
				#first round of mashing: need to setup session

				@quotes=Category.find(@category).quotes.select("id, matchups, score, quote").order("matchups")
				
				@quotes_all=@quotes.all
				@matched_quotes=matchup(@quotes_all)
				
				session[:matched_quotes]=@matched_quotes
				session[:matched_quotes_size]=@matched_quotes.size

			elsif @index>=2 and @index<=(session[:matched_quotes_size]-2)
				#subsequent rounds: need to save results from previous round

				q1=Quote.find(session[:matched_quotes][@index-2].id)
				q1.matchups+=1
					
					
				q2=Quote.find(session[:matched_quotes][@index-1].id)
				q2.matchups+=1
					
				if @win==1
					q1[:score]+=(q2[:score]+1)/q1[:score]
				elsif @win==2
					q2[:score]+=(q1[:score]+1)/q2[:score]
				end
					
				q1.save
				q2.save
				
			else
				#index error
			
				flash[:notice]="Error: index cannot be = #{@index}"
			end
	
	
	end

end
