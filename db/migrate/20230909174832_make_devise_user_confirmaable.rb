class MakeDeviseUserConfirmaable < ActiveRecord::Migration[7.0]
  def change
    change_table :users do |t|
      t.string :confirmation_token,   after: :encrypted_password
      t.datetime :confirmed_at,       after: :confirmation_token
      t.datetime :confirmation_sent_at, after: :confirmed_at
      t.string :unconfirmed_email,    after: :confirmation_sent_at
    end
  end
end
