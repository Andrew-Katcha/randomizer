#!/usr/bin/env ruby 
require 'pry'
require 'pg' 
require 'faker'
require_relative 'lib/user_book'
require_relative 'lib/review'
require_relative 'lib/publisher'
require_relative 'lib/_user'
require_relative 'lib/book'

puts "user_book(1), review(2), publisher(3), _user(4), book(5) "
response = gets.chomp
conn = PG.connect( dbname: 'goodreads' ) 

case response
when '1'
  UserBook.add_to_db(conn)

when '2'
  Review.add_to_db(conn)

when '3'
  Publisher.add_to_db(conn)

when '4'
  User.add_to_db(conn)

when '5'
  Book.add_to_db(conn)

else
  puts "got nothin"
end
 
