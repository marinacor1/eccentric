class CreateDestinations < ActiveRecord::Migration
  def change
    create_table :destinations do |t|
      t.string :planet

      t.timestamps null: false
    end
  end
end
