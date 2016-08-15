require 'pry'
require 'pg' 
require 'faker'

module Review
	def self.add_to_db(conn)
		15.times do 
		  difficulty = Faker::Number.between(1, 5)
		  writing_quality = Faker::Number.between(1, 5)
		  usefullness = Faker::Number.between(1, 5)
		  overall_rating = Faker::Number.between(1, 5)
		  book_id = Faker::Number.number(9)
		  
		  conn.exec( "INSERT INTO review (difficulty, 
		                                  writing_quality, 
		                                  usefullness,
		                                  overall_rating,
		                                  book_id) 
		              VALUES('#{difficulty}',
		                     '#{writing_quality}',
		                     '#{usefullness}',
		                     '#{overall_rating}',
		                     '#{book_id}');") do |result| 
		    puts " #{difficulty} | #{writing_quality} | #{usefullness} | #{overall_rating} | #{book_id}" 
		  end
		end
	end
end