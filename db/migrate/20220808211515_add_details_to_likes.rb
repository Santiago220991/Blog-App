class AddDetailsToLikes < ActiveRecord::Migration[7.0]
  def change
    add_column :likes, :authorid, :integer
    add_column :likes, :postid, :integer
    add_column :likes, :createdat, :date
    add_column :likes, :updatedat, :date
  end
end
