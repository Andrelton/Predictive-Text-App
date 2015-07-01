class AddPhotoColumnToDocs < ActiveRecord::Migration
  def change
    add_column :docs, :photo, :string
  end
end
