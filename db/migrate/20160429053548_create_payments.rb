class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.date :due_date
      t.references :subscription

      t.timestamps null: false
    end
  end
end
