class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :user_name, null: false
      t.string :avatar
      t.timestamps
    end
  end
end
