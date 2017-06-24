class AddNameToThreads < ActiveRecord::Migration[5.1]
  def change
    add_column :bbs_threads, :name, :string
  end
end
