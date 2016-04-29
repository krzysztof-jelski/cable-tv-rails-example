class Client < ActiveRecord::Base
  has_many :payments
  has_many :subscriptions
  validates :first_name, presence: true
  validates :last_name, presence: true

  def vindicatable?
    payments.overdue.order(due_date: :asc).first.due_date < DateTime.current-180.days
  end

end
