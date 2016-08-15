require 'pry'
require 'pg' 
require 'faker'

module UserBook
	def self.add_to_db(conn)
		3.times do
	    user_id = Faker::Number.number(7)#Faker::Number.between(1, 5)
	    book_id = 948119465-5#Faker::Number.between(1, 5)
	    conn.exec( "INSERT INTO user_book (user_id, 
	                                       book_id) 
	                VALUES('#{user_id}',
	                       '#{book_id}');") do |result| 
	      puts "  #{user_id} | #{book_id}" 
	    end
  	end
	end
end