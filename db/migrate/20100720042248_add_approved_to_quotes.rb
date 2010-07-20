class AddApprovedToQuotes < ActiveRecord::Migration
  def self.up
    add_column :quotes, :approved, :boolean, :default => false
  end

  def self.down
    remove_column :quotes, :approved
  end
end
