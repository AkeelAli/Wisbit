class AddMatchupsToQuote < ActiveRecord::Migration
  def self.up
    add_column :quotes, :matchups, :integer
  end

  def self.down
    remove_column :quotes, :matchups
  end
end
