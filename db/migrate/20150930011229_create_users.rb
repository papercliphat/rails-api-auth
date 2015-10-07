class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :auth_token
      t.integer :mega_trust_score
      t.integer :mega_mod_score
      t.string :password_reset_token
      t.datetime :password_reset_sent_at

      t.timestamps null: false
    end
      add_index(:users, :email)
  end
end
