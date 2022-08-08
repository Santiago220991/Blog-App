class AddDetailsToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :authorid, :integer
    add_column :posts, :title, :text
    add_column :posts, :text, :text
    add_column :posts, :createdat, :date
    add_column :posts, :updatedat, :date
    add_column :posts, :commentscounter, :integer
    add_column :posts, :likescounter, :integer
  end
end
