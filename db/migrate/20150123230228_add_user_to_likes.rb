class AddUserToLikes < ActiveRecord::Migration
  def change
    add_column :likes, :user_id, :integer
    add_column :likes, :bookmark_id, :integer 
  end
end
