class AddCategoryIdToQuote < ActiveRecord::Migration
  def self.up
    add_column :quotes, :category_id, :integer
  end

  def self.down
    remove_column :quotes, :category_id
  end
end
