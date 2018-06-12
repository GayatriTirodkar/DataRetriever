class User
  include Mongoid::Document
  include ActiveModel::Validations
  extend Enumerize

  field :first_name, type: String
  field :last_name, type: String
  field :gender, type: String
  field :qualification, type: String
  field :occupation, type: String
  field :address, type: String
  field :email_id, type: String

  index({ first_name: 1, last_name: 1, gender: 1, qualification: 1, occupation: 1, address: 1, mobile_number: "text", email_id: 1})

  enumerize :gender, in: %w(Male Female), scope: true

  validates :first_name, :last_name, presence: true
  validates :gender, inclusion: {in: %w(Male Female), message: "Please specify valid input(Male / Female)"}
  validates :email_id, presence: true, uniqueness: true, email: true

  def self.search(term)
    if ["Male", "male", "Female", "female"].include? term
      User.where(gender: term.to_s.capitalize).all
    else
      User.any_of({first_name: /#{term}/i}, {last_name: /#{term}/i}, {qualification: /#{term}/i}, {occupation: /#{term}/i}, {address: /#{term}/i}, {email_id: /#{term}/})
    end
  end

end
