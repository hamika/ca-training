class RenameThreadsToBbsThreads < ActiveRecord::Migration[5.1]
  def change
    rename_table :threads, :bbs_threads
  end
end
