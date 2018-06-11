class User
  include Mongoid::Document
  include Mongoid::Phony
  include Sunspot::Mongoid
  include ActiveModel::Validations
  extend Enumerize

  field :first_name, type: String
  field :last_name, type: String
  field :age, type: Integer
  field :gender, type: String
  field :qualification, type: String
  field :occupation, type: String
  field :address, type: String
  field :mobile_number, type: String
  field :email_id, type: String


  enumerize :gender, in: %w(Male Female), scope: true

  validates :first_name, :last_name, presence: true
  validates :age, length: {maximum: 3}, numericality: {only_integer: true}, :on => :create
  validates :gender, inclusion: {in: %w(Male Female), message: "Please specify valid input(Male / Female)"}
  validates :mobile_number, phony_plausible: true, uniqueness: true
  validates :email_id, presence: true, uniqueness: true, email: true

  searchable do
    text :first_name, :last_name, :age, :gender, :qualification, :occupation, :address, :mobile_number, :email_id
  end
  #Sunspot.index(User.all)

end
