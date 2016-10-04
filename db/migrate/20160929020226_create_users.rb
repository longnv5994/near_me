class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :provider
      t.string :uid
      t.string :oauth_token
      t.string :image
      t.datetime :oauth_expires_at
      t.boolean :signed_in

      t.timestamps
    end
  end
end
