class SetsRequestsToDefaultFalse < ActiveRecord::Migration
  def change
    change_column :requests, :active, :boolean, :default => false
    change_column :requests, :direct_request, :boolean, :default => false

  end
end
