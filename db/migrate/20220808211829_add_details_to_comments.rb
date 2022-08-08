class AddDetailsToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :authorid, :integer
    add_column :comments, :postid, :integer
    add_column :comments, :text, :text
    add_column :comments, :updatedat, :date
    add_column :comments, :createdat, :date
  end
end
