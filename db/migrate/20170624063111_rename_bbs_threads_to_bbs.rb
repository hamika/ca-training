class RenameBbsThreadsToBbs < ActiveRecord::Migration[5.1]
  def change
    rename_table :bbs_threads, :bbs
  end
end
