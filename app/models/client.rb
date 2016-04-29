class Client < ActiveRecord::Base
  has_many :payments
  has_many :subscriptions
  validates :first_name, presence: true
  validates :last_name, presence: true

  def vindicatable?
    if oldest_payment
      oldest_payment.due_date < DateTime.current-180.days &&
        payments.inject(0) { |acc, payment| acc += payment.subscription.price.to_i } > 1000
    end
  end

  private

  def oldest_payment
    payments.overdue.order(due_date: :asc).first
  end

end
