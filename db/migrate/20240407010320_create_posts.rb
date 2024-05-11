class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
          t.string :title, null:false
          t.string :summary
          t.string :items
          t.string :budget
          t.datetime :start_time
          t.datetime :end_time
          t.string :text
          t.string :image01
          t.string :image02
          t.string :image03
          t.references :user, foreign_key: true,  null: false
      t.timestamps
    end
  end
end
