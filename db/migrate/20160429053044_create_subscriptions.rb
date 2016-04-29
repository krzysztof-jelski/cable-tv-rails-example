class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.decimal :price, precision: 10, scale: 2
      t.date :start
      t.date :stop
      t.string :product_name
      t.references :client

      t.timestamps null: false
    end
  end
end
