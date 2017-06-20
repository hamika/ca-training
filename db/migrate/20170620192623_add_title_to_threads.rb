class AddTitleToThreads < ActiveRecord::Migration[5.1]
  def change
    add_column :threads, :title, :text
  end
end
