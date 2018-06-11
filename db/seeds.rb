require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'user_sample_data.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  user = User.new
  user.first_name = row['first_name']
  user.last_name = row['last_name']
  user.age = row['age']
  user.gender = row['gender']
  user.qualification = row['qualification']
  user.occupation = row['occupation']
  user.address = row['address']
  user.mobile_number =  row['mobile_number']
  user.email_id = row['email_id']
  user.save!
end

puts "Successfully inserted #{User.count} records in Users Table"
