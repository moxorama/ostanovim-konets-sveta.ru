class CreateStoppers < ActiveRecord::Migration
  def change
    create_table :stoppers do |t|
      t.integer :value
      t.timestamps
    end
  end
end
