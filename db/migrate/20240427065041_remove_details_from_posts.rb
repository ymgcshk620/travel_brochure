class RemoveDetailsFromPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :start_date, :string
    remove_column :posts, :end_date, :string
  end
end
