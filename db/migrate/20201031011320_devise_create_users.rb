# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string :provider
      t.string :uid
      t.string :remember_token
      t.datetime :remember_created_at
      t.timestamps null: false

          ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
    end
    
    add_index :users, :email, unique: true
    add_index :users, [:uid, :provider], unique: true
  end 
end 
 