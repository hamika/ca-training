class AddCommentToThreads < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.belongs_to :bbs
      t.string :name
      t.string :title
      t.string :body
      t.timestamps
    end
  end
end
