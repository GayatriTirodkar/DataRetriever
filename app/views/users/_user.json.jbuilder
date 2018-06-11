json.extract! user, :id, :first_name, :last_name, :age, :gender, :qualification, :occupation, :address, :mobile_number, :email_id, :created_at, :updated_at
json.url user_url(user, format: :json)
