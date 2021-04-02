class CreatePost < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.text :post_name 
      t.text :content

      t.timestamps
    end
  end
end
