require 'pry'
require 'pg' 
require 'faker'

module Publisher
	def self.add_to_db(conn)
		15.times do 
		  company_name = Faker::Company.name
		  description = Faker::Company.catch_phrase
		  founding_year = Faker::Business.credit_card_expiry_date
		  publisher_id = Faker::Code.ean

		  conn.exec( "INSERT INTO publisher (company_name, 
		                                     description, 
		                                     founding_year,
		                                     publisher_id) 
		             VALUES('#{company_name}',
		                      '#{description}',
		                      '#{founding_year}',
		                      '#{publisher_id}');") do |result| 
		    puts " #{company_name} | #{description} | #{founding_year} | #{publisher_id} " 
		  end
		end
	end
end