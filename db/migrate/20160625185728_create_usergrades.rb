class CreateUsergrades < ActiveRecord::Migration
  def change
    create_table :usergrades do |t|
      t.references :user, index: true, foreign_key: true
      t.references :grade, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
