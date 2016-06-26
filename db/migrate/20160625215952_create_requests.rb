class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.datetime :date
      t.boolean :active
      t.boolean :direct_request
      t.string :notes

      t.timestamps null: false
    end
  end
end
