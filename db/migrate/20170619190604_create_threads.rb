class CreateThreads < ActiveRecord::Migration[5.1]
  def change
    create_table :threads do |t|
      t.text :body
    end
  end
end
