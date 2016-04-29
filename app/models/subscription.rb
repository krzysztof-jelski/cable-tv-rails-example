class Subscription < ActiveRecord::Base
  belongs_to :client
  has_many :payments
end
