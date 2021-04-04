class CreateComment < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :comment_name 
      t.text :message
      t.text :post_id

      t.timestamps
    end
  end
end
