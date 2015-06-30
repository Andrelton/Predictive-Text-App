class CreateDocs < ActiveRecord::Migration
  def change
    create_table :docs do |t|
      t.string :title
      t.text :content
      t.integer :user_id
      t.timestamps
    end
  end
end
