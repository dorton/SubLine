class CreateSchoolsubjects < ActiveRecord::Migration
  def change
    create_table :schoolsubjects do |t|
      t.references :school, index: true, foreign_key: true
      t.references :subject, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
