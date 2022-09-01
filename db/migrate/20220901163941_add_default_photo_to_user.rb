class AddDefaultPhotoToUser < ActiveRecord::Migration[7.0]
  def change
    change_column(:users, :photo, :string, default: "https://www.tuktukdesign.com/wp-content/uploads/2021/03/person-icon.jpg")
  end
end
