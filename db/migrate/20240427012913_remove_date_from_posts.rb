class RemoveDateFromPosts < ActiveRecord::Migration[6.1]
  
  def up
     remove_column :posts, :date, :string
  end

  def down
      add_column :posts, :date, :string
  end

end
