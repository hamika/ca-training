class CreateBody < ActiveRecord::Migration[5.1]
  def change
    create_table :body do |t|
      t.string :name
    end
  end
end
