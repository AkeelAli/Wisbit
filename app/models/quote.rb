class Quote < ActiveRecord::Base
	belongs_to :category

	attr_accessor :matchups, :quote, :score, :title
end
