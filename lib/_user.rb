require 'pry'
require 'pg' 
require 'faker'

module User
	def self.add_to_db(conn)
		15.times do
		  first_name = Faker::Name.first_name
		  last_name =Faker::Name.last_name
		  password = Faker::Internet.password
		  email = Faker::Internet.free_email
		  user_id = Faker::Code.ean

		  conn.exec( "INSERT INTO _user (first_name, 
		                                last_name, 
		                                password,
		                                email, 
		                                user_id) 
		              VALUES('#{first_name}',
		                       '#{last_name}',
		                       '#{password}',
		                       '#{email}',
		                       '#{user_id}');") do |result| 
		    puts " #{first_name} | #{last_name} | #{password} | #{email} | #{user_id} " 
		  end
		end
	end
end