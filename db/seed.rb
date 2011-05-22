f=File.open("seeds.rb","w")

#f.puts "Quote.delete_all\n"
#f.puts "Category.delete_all\n"

category=42

Dir.glob("*.txt") do |file|
	
	filename=file.gsub(/.txt/,'')

	f.puts "Category.create(:name=>\"#{filename}\")"

	File.open(file,"r").each do |line|
		line=line.gsub(/\"/,'\\\"')
		line=line.gsub(/\n/,'')
		f.puts "Quote.create(:quote=>\"#{line}\", :score=> 0, :category_id=>#{category}, :matchups => 0)" if line!="" and line!=" "
	end

	category+=1

end

f.close
