#Matchup algorithm determining which quotes to show/display
#It starts with a sorted array of the quotes based on their previous
#number of matchups (array a1)
#It creates matchups of these quotes in the following order:
#*matchups with quotes having the lowest previous matchups are favored
#*repetition of qutoes is minimized (quotes repeated only after cycle)
#
#input: array a1 with sorted quotes
#output: calls to show(i,k) based on abovementioned order
#
#TODO: modify show to perform the actual showing
#TODO: comparison in the if statement should be based on
#				numMatchups attribute of each quote (and not the quote itself)


def circular_left_shift(a)
	f=a.delete_at(0)
	a.push(f)
end

def show(i,k)
	print i+k
	print ","
end


a1=[0,1,2,3,4,5,6,7,8,9]
a2=a1.dup
left_shifts=0
n=a1.length
matchups=[]

while (left_shifts < n-1) do
	a2=circular_left_shift(a2)
	left_shifts+=1

	s1=0
	s2=n-left_shifts
 	
	while (s1<s2) do
		if (a1[s1]+a2[s1]) <= (a1[s2]+a2[s2])
			show(a1[s1],a2[s1])
			matchups.push(a1[s1].to_s+":"+a2[s1].to_s)
			s1+=1
		else
			show(a1[s2],a2[s2])
			matchups.push(a1[s2].to_s+":"+a2[s2].to_s)
			s2-=1
		end
	end

	puts
end


