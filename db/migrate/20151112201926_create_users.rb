class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email_digest
      t.string :password_digest
      t.string :alias

      t.timestamps null: false
    end
  end
end
