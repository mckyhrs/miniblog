class CreatePosts < ActiveRecord::Migration[8.0]
  def change
    create_table :posts do |t|
      t.text :content, null: false

      t.timestamps
    end
  end
end
