class Client < ActiveRecord::Base
  has_many :payments

  validates :first_name, presence: true
  validates :last_name, presence: true
end
