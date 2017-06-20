class DropTables < ActiveRecord::Migration[5.1]
  def change
    drop_table :body
  end
end
