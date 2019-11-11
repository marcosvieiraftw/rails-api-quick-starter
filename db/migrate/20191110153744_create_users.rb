class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name, limit: 60
      t.string :email, limit: 100
      t.string :password_digest, limit: 72
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
