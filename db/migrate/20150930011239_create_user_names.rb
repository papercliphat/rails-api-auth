class CreateUserNames < ActiveRecord::Migration
  def change
    create_table :user_names do |t|
      t.string :user_name
      t.references :user, index: true, foreign_key: true
      t.boolean :banned, default: false
      t.datetime :banned_date

      t.timestamps null: false
    end
      add_index :user_names, [:user_name]
      add_index :user_names, [:user_name, :banned]
  end
end
