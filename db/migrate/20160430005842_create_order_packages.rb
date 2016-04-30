class CreateOrderPackages < ActiveRecord::Migration
  def change
    create_table :order_packages do |t|
      t.references :order, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.references :package, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
