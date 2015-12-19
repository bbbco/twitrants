class RenameImageToImageUrlFromUsers < ActiveRecord::Migration
  def change
    rename_column :users, :image, :image_url
  end
end
