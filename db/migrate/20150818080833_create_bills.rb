class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.string :name
      t.string :period
      t.string :groupname

      t.timestamps null: false
    end
  end
end