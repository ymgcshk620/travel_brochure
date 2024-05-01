class ChangeDataBudgetToPosts < ActiveRecord::Migration[6.1]
  
    def up
      # text型からstring型へ変更
      change_column :posts, :budget, :string
  end

  def down
      # string型からtext型へ戻す
      change_column :posts, :budget, :bigint
  end
  
end
