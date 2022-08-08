class AddDetailsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :text
    add_column :users, :photo, :string
    add_column :users, :bio, :text
    add_column :users, :updatedat, :date
    add_column :users, :createdat, :date
    add_column :users, :postscounter, :integer
  end
end
