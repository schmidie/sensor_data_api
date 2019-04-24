class DeviseTokenAuthCreateNodes < ActiveRecord::Migration[5.2]
  def change

    create_table(:nodes) do |t|
      ## Required
      t.string :provider, :null => false, :default => "email"
      t.string :uid, :null => false, :default => ""

      ## Database authenticatable
      t.string :encrypted_password, :null => false, :default => ""

      ## Trackable
      t.integer  :sign_in_count, :default => 0, :null => false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Node Info
      t.string :mac
      t.string :email

      ## Tokens
      t.json :tokens

      t.timestamps
    end

    add_index :nodes, :mac,                unique: true
    add_index :nodes, [:uid, :provider],     unique: true
    # add_index :nodes, :unlock_token,       unique: true
  end
end
