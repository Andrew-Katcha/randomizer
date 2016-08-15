require 'pry'
require 'pg' 
require 'faker'

module Book
	def self.add_to_db(conn)
		15.times do 
		  title= Faker::Book.title
		  genre = Faker::Book.genre
		  sentence = Faker::Hipster.sentence(7, false, 2)
		  author = Faker::Book.author
		  publish_date = Faker::Business.credit_card_expiry_date
		  book_id = Faker::Code.isbn
		  publisher_id = Faker::Code.ean


		  conn.exec( "INSERT INTO book (name, 
		                                genre, 
		                                description,
		                                author, 
		                                publish_date, 
		                                book_id, 
		                                publisher_id) 
		              VALUES('#{title}',
		                     '#{genre}',
		                     '#{sentence}',
		                     '#{author}',
		                     '#{publish_date}',
		                     '#{book_id}',
		                     '#{publisher_id}');") do |result| 
		    puts " #{title} | #{genre} | #{sentence} | #{author} | #{publish_date} 
		    | #{book_id} | #{publisher_id} " 
		  end
		end
	end
end