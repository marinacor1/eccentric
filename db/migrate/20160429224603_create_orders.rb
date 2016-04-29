class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :user_id
      t.string :status
      t.string :total_cost, precision: 20, scale: 2

      t.timestamps null: false
    end
  end
end
