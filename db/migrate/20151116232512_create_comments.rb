class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :post
      t.references :user
      t.string :body
      t.integer :likes

      t.timestamps null: false
    end
  end
end
