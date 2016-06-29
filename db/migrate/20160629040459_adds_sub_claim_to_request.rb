class AddsSubClaimToRequest < ActiveRecord::Migration
  def change
    add_column :requests, :sub_claim, :boolean, :default => false
  end
end
