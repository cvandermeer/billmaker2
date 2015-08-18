class CreateCompetences < ActiveRecord::Migration
  def change
    create_table :competences do |t|
      t.string :title
      t.integer :points
      t.string :level
      t.integer :bill_id
    end
  end
end
