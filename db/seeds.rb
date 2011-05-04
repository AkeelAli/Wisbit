# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

Quote.delete_all

Quote.create(:quote=>"Quote:1 score:3 category:1", :score=> 3, :category_id=> 1, :matchups => 0)
Quote.create(:quote=>"Quote:2 score:4 category:1", :score=> 4, :category_id=> 1, :matchups => 0)
Quote.create(:quote=>"Quote:3 score:6 category:1", :score=> 6, :category_id=> 1, :matchups => 0)
Quote.create(:quote=>"Quote:4 score:2 category:1", :score=> 2, :category_id=> 1, :matchups => 0)
Quote.create(:quote=>"Quote:5 score:8 category:1", :score=> 8, :category_id=> 1, :matchups => 0)
Quote.create(:quote=>"Quote:6 score:10 category:1", :score=> 10, :category_id=> 1, :matchups => 0)
Quote.create(:quote=>"Quote:7 score:2 category:1", :score=> 2, :category_id=> 1, :matchups => 0)
Quote.create(:quote=>"Quote:8 score:7 category:1", :score=> 7, :category_id=> 1, :matchups => 0)
Quote.create(:quote=>"Quote:9 score:9 category:1", :score=> 9, :category_id=> 1, :matchups => 0)
Quote.create(:quote=>"Quote:10 score:3 category:1", :score=> 3, :category_id=> 1, :matchups => 0)

Quote.create(:quote=>"Quote:1 score:3 category:2", :score=> 3, :category_id=> 2, :matchups => 0)
Quote.create(:quote=>"Quote:2 score:4 category:2", :score=> 4, :category_id=> 2, :matchups => 0)
Quote.create(:quote=>"Quote:3 score:6 category:2", :score=> 6, :category_id=> 2, :matchups => 0)
Quote.create(:quote=>"Quote:4 score:2 category:2", :score=> 2, :category_id=> 2, :matchups => 0)
Quote.create(:quote=>"Quote:5 score:8 category:2", :score=> 8, :category_id=> 2, :matchups => 0)
Quote.create(:quote=>"Quote:6 score:10 category:2", :score=> 10, :category_id=> 2, :matchups => 0)
Quote.create(:quote=>"Quote:7 score:2 category:2", :score=> 2, :category_id=> 2, :matchups => 0)
Quote.create(:quote=>"Quote:8 score:7 category:2", :score=> 7, :category_id=> 2, :matchups => 0)
Quote.create(:quote=>"Quote:9 score:9 category:2", :score=> 9, :category_id=> 2, :matchups => 0)
Quote.create(:quote=>"Quote:10 score:3 category:2", :score=> 3, :category_id=> 2, :matchups => 0)
