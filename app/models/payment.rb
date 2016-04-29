class Payment < ActiveRecord::Base
  belongs_to :client
  belongs_to :subscription
  scope :overdue, -> { where('due_date < ? AND paid_at IS NULL', DateTime.current) }
end
