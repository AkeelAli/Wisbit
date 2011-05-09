class CreateQuotes < ActiveRecord::Migration
  def self.up
    create_table :quotes do |t|
      t.string :title
      t.text :quote
      t.decimal :score,:precision=>10, :scale=>2

      t.timestamps
    end
  end

  def self.down
    drop_table :quotes
  end
end
