class CreateUserrequests < ActiveRecord::Migration
  def change
    create_table :userrequests do |t|
      t.references :user, index: true, foreign_key: true
      t.references :request, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
