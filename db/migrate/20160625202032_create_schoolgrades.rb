class CreateSchoolgrades < ActiveRecord::Migration
  def change
    create_table :schoolgrades do |t|
      t.references :school, index: true, foreign_key: true
      t.references :grade, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
